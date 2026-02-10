"""
Pydantic schemas for voice/audio processing endpoints.
"""
from typing import Optional, Literal
from pydantic import BaseModel, Field


class AudioUploadResponse(BaseModel):
    """Response schema for audio file upload."""
    file_id: str = Field(..., description="Unique file identifier")
    file_path: str = Field(..., description="Path to stored audio file")
    file_size: int = Field(..., description="File size in bytes")
    format: str = Field(..., description="Audio format (e.g., 'mp3', 'wav')")
    duration_seconds: Optional[float] = Field(None, description="Audio duration")
    message: str = Field(default="Audio uploaded successfully")


class TranscriptionRequest(BaseModel):
    """Request schema for audio transcription."""
    file_path: str = Field(..., description="Path to audio file")
    language: Optional[str] = Field(
        default="en",
        description="Audio language code (ISO 639-1)"
    )
    model: Optional[Literal["tiny", "base", "small", "medium", "large"]] = Field(
        default="base",
        description="Whisper model size"
    )


class TranscriptionResponse(BaseModel):
    """Response schema for audio transcription."""
    transcript: str = Field(..., description="Transcribed text")
    language: str = Field(..., description="Detected/specified language")
    confidence: Optional[float] = Field(
        None,
        ge=0.0,
        le=1.0,
        description="Transcription confidence score"
    )
    duration_seconds: float = Field(..., description="Audio duration")
    processing_time_ms: float = Field(..., description="Processing time in milliseconds")


class VoiceCommandRequest(BaseModel):
    """Request schema for processing voice command (end-to-end)."""
    # Audio can be provided as file_path or base64 encoded
    file_path: Optional[str] = Field(None, description="Path to audio file")
    audio_base64: Optional[str] = Field(None, description="Base64 encoded audio data")
    audio_format: Optional[str] = Field(
        default="wav",
        description="Audio format if using base64"
    )
    
    # Alternative: provide pre-transcribed text
    transcript: Optional[str] = Field(None, description="Pre-transcribed text")
    
    # Context
    timezone: str = Field(default="UTC", description="User's timezone")
    language: str = Field(default="en", description="Language code")


class VoiceCommandResponse(BaseModel):
    """Response schema for voice command processing."""
    success: bool = Field(..., description="Whether processing was successful")
    message: str = Field(..., description="User-friendly message")
    
    # Transcription
    transcript: str = Field(..., description="Transcribed text")
    
    # Intent and extraction
    intent_type: str = Field(..., description="Detected intent type")
    confidence: float = Field(..., ge=0.0, le=1.0, description="Intent confidence")
    
    # Created entities
    task_id: Optional[int] = Field(None, description="Created task ID")
    event_id: Optional[int] = Field(None, description="Created event ID")
    task: Optional[dict] = Field(None, description="Created task details")
    event: Optional[dict] = Field(None, description="Created event details")
    
    # Metadata
    processing_time_ms: float = Field(..., description="Total processing time")
    error: Optional[str] = Field(None, description="Error message if failed")