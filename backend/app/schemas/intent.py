"""
Pydantic schemas for intent extraction and voice processing.
"""
from datetime import datetime
from typing import Optional, List, Literal
from pydantic import BaseModel, Field, validator
from enum import Enum


class IntentType(str, Enum):
    """Types of intents that can be extracted from voice input."""
    CREATE_TASK = "create_task"
    CREATE_EVENT = "create_event"
    CREATE_REMINDER = "create_reminder"
    LIST_TASKS = "list_tasks"
    LIST_EVENTS = "list_events"
    COMPLETE_TASK = "complete_task"
    UPDATE_TASK = "update_task"
    DELETE_TASK = "delete_task"
    UNKNOWN = "unknown"


class ExtractedDateTime(BaseModel):
    """Extracted date and time information."""
    date: Optional[str] = Field(None, description="Extracted date (YYYY-MM-DD)")
    time: Optional[str] = Field(None, description="Extracted time (HH:MM)")
    datetime: Optional[datetime] = Field(None, description="Combined datetime object")
    is_all_day: bool = Field(default=False, description="Whether it's an all-day event")
    relative: Optional[str] = Field(None, description="Relative time reference (e.g., 'tomorrow', 'next week')")


class ExtractedTask(BaseModel):
    """Task information extracted from voice input."""
    title: str = Field(..., description="Task title", max_length=255)
    description: Optional[str] = Field(None, description="Task description")
    due_date: Optional[datetime] = Field(None, description="Task due date")
    priority: Literal["low", "medium", "high", "urgent"] = Field(
        default="medium",
        description="Task priority"
    )
    tags: List[str] = Field(default_factory=list, description="Task tags")


class ExtractedEvent(BaseModel):
    """Event information extracted from voice input."""
    title: str = Field(..., description="Event title", max_length=255)
    description: Optional[str] = Field(None, description="Event description")
    location: Optional[str] = Field(None, description="Event location", max_length=500)
    start_time: datetime = Field(..., description="Event start time")
    end_time: Optional[datetime] = Field(None, description="Event end time")
    all_day: bool = Field(default=False, description="All-day event flag")


class ExtractedReminder(BaseModel):
    """Reminder information extracted from voice input."""
    title: str = Field(..., description="Reminder title", max_length=255)
    description: Optional[str] = Field(None, description="Reminder description")
    reminder_time: datetime = Field(..., description="When to remind")


class IntentExtractionResult(BaseModel):
    """Result of intent extraction from voice transcription."""
    intent_type: IntentType = Field(..., description="Detected intent type")
    confidence: float = Field(..., ge=0.0, le=1.0, description="Confidence score")
    
    # Extracted entities
    task: Optional[ExtractedTask] = None
    event: Optional[ExtractedEvent] = None
    reminder: Optional[ExtractedReminder] = None
    
    # Context
    raw_text: str = Field(..., description="Original transcribed text")
    reasoning: Optional[str] = Field(None, description="LLM reasoning for the extraction")
    
    @validator("task", "event", "reminder")
    def validate_intent_data(cls, v, values):
        """Ensure the appropriate data is present for the intent type."""
        intent_type = values.get("intent_type")
        
        if intent_type == IntentType.CREATE_TASK and not values.get("task"):
            raise ValueError("Task data required for CREATE_TASK intent")
        elif intent_type == IntentType.CREATE_EVENT and not values.get("event"):
            raise ValueError("Event data required for CREATE_EVENT intent")
        elif intent_type == IntentType.CREATE_REMINDER and not values.get("reminder"):
            raise ValueError("Reminder data required for CREATE_REMINDER intent")
        
        return v


class VoiceProcessingRequest(BaseModel):
    """Request schema for processing voice input."""
    # Either audio_url (for uploaded file) or transcript (if already transcribed)
    audio_url: Optional[str] = Field(None, description="URL/path to audio file")
    transcript: Optional[str] = Field(None, description="Pre-transcribed text")
    
    # Optional context
    timezone: Optional[str] = Field(
        default="UTC",
        description="User's timezone for date/time parsing"
    )
    language: Optional[str] = Field(
        default="en",
        description="Audio/text language code"
    )
    
    @validator("audio_url", "transcript")
    def validate_input(cls, v, values):
        """Ensure either audio_url or transcript is provided."""
        if not values.get("audio_url") and not values.get("transcript"):
            raise ValueError("Either audio_url or transcript must be provided")
        return v


class VoiceProcessingResponse(BaseModel):
    """Response schema for voice processing."""
    success: bool = Field(..., description="Whether processing was successful")
    transcript: str = Field(..., description="Transcribed text")
    intent_result: IntentExtractionResult = Field(..., description="Extracted intent")
    
    # Created entities
    task_id: Optional[int] = Field(None, description="Created task ID")
    event_id: Optional[int] = Field(None, description="Created event ID")
    
    # Processing metadata
    processing_time_ms: float = Field(..., description="Processing time in milliseconds")
    message: Optional[str] = Field(None, description="Additional message for the user")