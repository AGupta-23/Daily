"""
Pydantic schemas for Task API endpoints.
"""
from datetime import datetime
from typing import Optional, List
from pydantic import BaseModel, Field, validator

from ..models.task import TaskPriority, TaskStatus


class TaskBase(BaseModel):
    """Base task schema with common fields."""
    title: str = Field(..., min_length=1, max_length=255, description="Task title")
    description: Optional[str] = Field(None, description="Task description")
    due_date: Optional[datetime] = Field(None, description="Task due date")
    reminder_time: Optional[datetime] = Field(None, description="Reminder time")
    priority: TaskPriority = Field(default=TaskPriority.MEDIUM, description="Task priority")
    tags: Optional[str] = Field(None, max_length=500, description="Comma-separated tags")


class TaskCreate(TaskBase):
    """Schema for creating a new task."""
    is_reminder: bool = Field(default=False, description="Whether this is a reminder")
    
    @validator("reminder_time")
    def validate_reminder_time(cls, v, values):
        """Ensure reminder_time is set if is_reminder is True."""
        if values.get("is_reminder") and not v:
            raise ValueError("reminder_time is required when is_reminder is True")
        return v


class TaskUpdate(BaseModel):
    """Schema for updating an existing task."""
    title: Optional[str] = Field(None, min_length=1, max_length=255)
    description: Optional[str] = None
    due_date: Optional[datetime] = None
    reminder_time: Optional[datetime] = None
    priority: Optional[TaskPriority] = None
    status: Optional[TaskStatus] = None
    tags: Optional[str] = Field(None, max_length=500)


class TaskResponse(TaskBase):
    """Schema for task responses."""
    id: int
    user_id: int
    status: TaskStatus
    is_reminder: bool
    is_recurring: bool
    completed_at: Optional[datetime]
    created_from_voice: bool
    original_transcript: Optional[str]
    created_at: datetime
    updated_at: datetime
    
    # Computed fields
    is_overdue: bool = Field(..., description="Whether the task is overdue")
    tags_list: List[str] = Field(..., description="Tags as a list")
    
    class Config:
        from_attributes = True


class TaskListResponse(BaseModel):
    """Schema for paginated task list responses."""
    tasks: List[TaskResponse]
    total: int
    page: int
    page_size: int
    has_more: bool


class TaskStats(BaseModel):
    """Schema for task statistics."""
    total: int = Field(..., description="Total number of tasks")
    todo: int = Field(..., description="Number of TODO tasks")
    in_progress: int = Field(..., description="Number of IN_PROGRESS tasks")
    completed: int = Field(..., description="Number of COMPLETED tasks")
    overdue: int = Field(..., description="Number of overdue tasks")
    due_today: int = Field(..., description="Number of tasks due today")
    due_this_week: int = Field(..., description="Number of tasks due this week")


class TaskCompleteRequest(BaseModel):
    """Schema for marking a task as complete."""
    completed: bool = Field(default=True, description="Completion status")