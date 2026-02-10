"""
AI service for intent extraction using LLM (OpenAI or Anthropic).
Parses natural language into structured tasks, events, and reminders.
"""
import json
from typing import Dict, Any, Optional
from datetime import datetime, timedelta
import re

from openai import AsyncOpenAI
from anthropic import AsyncAnthropic

from ..core.config import settings
from ..schemas.intent import (
    IntentType,
    IntentExtractionResult,
    ExtractedTask,
    ExtractedEvent,
    ExtractedReminder,
)


class IntentExtractor:
    """Service for extracting structured intent from natural language."""
    
    def __init__(self):
        """Initialize the intent extractor with configured LLM provider."""
        self.provider = settings.llm_provider
        
        if self.provider == "openai":
            self.client = AsyncOpenAI(api_key=settings.openai_api_key)
            self.model = settings.llm_model
        elif self.provider == "anthropic":
            self.client = AsyncAnthropic(api_key=settings.anthropic_api_key)
            self.model = settings.llm_model
        else:
            raise ValueError(f"Unsupported LLM provider: {self.provider}")
    
    def _create_system_prompt(self, current_datetime: str, timezone: str) -> str:
        """Create system prompt for intent extraction."""
        return f"""You are an AI assistant specialized in extracting structured information from natural language for a productivity app.

Current datetime: {current_datetime}
User timezone: {timezone}

Your task is to analyze user input and extract:
1. Intent type (create_task, create_event, create_reminder, etc.)
2. Structured data for the relevant entity
3. Confidence score (0.0 to 1.0)

INTENT TYPES:
- create_task: User wants to create a todo item (e.g., "I need to buy groceries")
- create_event: User wants to schedule a calendar event (e.g., "I have class at 9am tomorrow")
- create_reminder: User wants a reminder at a specific time (e.g., "Remind me to call mom at 5pm")
- list_tasks: User wants to see their tasks
- list_events: User wants to see their calendar
- complete_task: User wants to mark something as done
- unknown: Cannot determine intent

RULES FOR DATE/TIME PARSING:
- "tomorrow" = +1 day from current date
- "next week" = +7 days
- "in 2 hours" = current time + 2 hours
- "afternoon" = 2:00 PM
- "evening" = 6:00 PM
- "morning" = 9:00 AM
- If time not specified for event, default to 1 hour duration
- Always output datetime in ISO format: YYYY-MM-DDTHH:MM:SS

PRIORITY DETECTION:
- "urgent", "asap", "immediately" → high/urgent
- "important" → high
- "when I have time", "eventually" → low
- Default → medium

Return your response as valid JSON with this structure:
{{
    "intent_type": "create_task|create_event|create_reminder|...",
    "confidence": 0.0-1.0,
    "reasoning": "brief explanation of your analysis",
    "task": {{  // if intent is create_task
        "title": "task title",
        "description": "optional description",
        "due_date": "ISO datetime or null",
        "priority": "low|medium|high|urgent",
        "tags": ["tag1", "tag2"]
    }},
    "event": {{  // if intent is create_event
        "title": "event title",
        "description": "optional description",
        "location": "optional location",
        "start_time": "ISO datetime",
        "end_time": "ISO datetime",
        "all_day": false
    }},
    "reminder": {{  // if intent is create_reminder
        "title": "reminder title",
        "description": "optional description",
        "reminder_time": "ISO datetime"
    }}
}}

Only include the object(s) relevant to the detected intent."""
    
    async def extract_intent(
        self,
        text: str,
        timezone: str = "UTC",
        context: Optional[Dict[str, Any]] = None
    ) -> IntentExtractionResult:
        """
        Extract structured intent from natural language text.
        
        Args:
            text: Natural language input
            timezone: User's timezone for datetime parsing
            context: Optional context (current tasks, events, etc.)
            
        Returns:
            IntentExtractionResult with extracted data
        """
        current_datetime = datetime.now().isoformat()
        system_prompt = self._create_system_prompt(current_datetime, timezone)
        
        try:
            if self.provider == "openai":
                response_data = await self._extract_with_openai(
                    system_prompt, text
                )
            else:
                response_data = await self._extract_with_anthropic(
                    system_prompt, text
                )
            
            return self._parse_llm_response(response_data, text)
            
        except Exception as e:
            # Fallback to unknown intent on error
            return IntentExtractionResult(
                intent_type=IntentType.UNKNOWN,
                confidence=0.0,
                raw_text=text,
                reasoning=f"Error during extraction: {str(e)}"
            )
    
    async def _extract_with_openai(
        self,
        system_prompt: str,
        user_message: str
    ) -> Dict[str, Any]:
        """Extract intent using OpenAI."""
        response = await self.client.chat.completions.create(
            model=self.model,
            messages=[
                {"role": "system", "content": system_prompt},
                {"role": "user", "content": user_message}
            ],
            temperature=0.3,
            response_format={"type": "json_object"}
        )
        
        content = response.choices[0].message.content
        return json.loads(content)
    
    async def _extract_with_anthropic(
        self,
        system_prompt: str,
        user_message: str
    ) -> Dict[str, Any]:
        """Extract intent using Anthropic Claude."""
        response = await self.client.messages.create(
            model=self.model,
            max_tokens=1024,
            system=system_prompt,
            messages=[
                {"role": "user", "content": user_message}
            ],
            temperature=0.3
        )
        
        content = response.content[0].text
        
        # Extract JSON from response (Claude might wrap it in markdown)
        json_match = re.search(r'\{.*\}', content, re.DOTALL)
        if json_match:
            content = json_match.group()
        
        return json.loads(content)
    
    def _parse_llm_response(
        self,
        data: Dict[str, Any],
        raw_text: str
    ) -> IntentExtractionResult:
        """Parse LLM response into IntentExtractionResult."""
        intent_type = IntentType(data.get("intent_type", "unknown"))
        confidence = float(data.get("confidence", 0.5))
        reasoning = data.get("reasoning")
        
        # Parse extracted entities
        task = None
        event = None
        reminder = None
        
        if "task" in data and data["task"]:
            task_data = data["task"]
            task = ExtractedTask(
                title=task_data["title"],
                description=task_data.get("description"),
                due_date=self._parse_datetime(task_data.get("due_date")),
                priority=task_data.get("priority", "medium"),
                tags=task_data.get("tags", [])
            )
        
        if "event" in data and data["event"]:
            event_data = data["event"]
            start_time = self._parse_datetime(event_data["start_time"])
            end_time = self._parse_datetime(event_data.get("end_time"))
            
            # If no end time, default to 1 hour after start
            if start_time and not end_time:
                end_time = start_time + timedelta(hours=1)
            
            event = ExtractedEvent(
                title=event_data["title"],
                description=event_data.get("description"),
                location=event_data.get("location"),
                start_time=start_time,
                end_time=end_time,
                all_day=event_data.get("all_day", False)
            )
        
        if "reminder" in data and data["reminder"]:
            reminder_data = data["reminder"]
            reminder = ExtractedReminder(
                title=reminder_data["title"],
                description=reminder_data.get("description"),
                reminder_time=self._parse_datetime(reminder_data["reminder_time"])
            )
        
        return IntentExtractionResult(
            intent_type=intent_type,
            confidence=confidence,
            task=task,
            event=event,
            reminder=reminder,
            raw_text=raw_text,
            reasoning=reasoning
        )
    
    def _parse_datetime(self, dt_str: Optional[str]) -> Optional[datetime]:
        """Parse datetime string to datetime object."""
        if not dt_str:
            return None
        
        try:
            # Handle ISO format
            return datetime.fromisoformat(dt_str.replace('Z', '+00:00'))
        except (ValueError, AttributeError):
            return None


# Global intent extractor instance
intent_extractor = IntentExtractor()