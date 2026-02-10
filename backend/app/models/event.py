"""
Event model for calendar events.
"""
from datetime import datetime
from sqlalchemy import (
    Column,
    Integer,
    String,
    Text,
    DateTime,
    Boolean,
    ForeignKey,
    Enum as SQLEnum,
)
from sqlalchemy.orm import relationship
import enum

from ..core.database import Base


class RecurrenceType(str, enum.Enum):
    """Recurrence types for events."""
    NONE = "none"
    DAILY = "daily"
    WEEKLY = "weekly"
    MONTHLY = "monthly"
    YEARLY = "yearly"


class Event(Base):
    """Calendar event model."""
    
    __tablename__ = "events"
    
    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"), nullable=False, index=True)
    
    # Event details
    title = Column(String(255), nullable=False)
    description = Column(Text, nullable=True)
    location = Column(String(500), nullable=True)
    
    # Timing
    start_time = Column(DateTime, nullable=False, index=True)
    end_time = Column(DateTime, nullable=False)
    all_day = Column(Boolean, default=False, nullable=False)
    
    # Recurrence
    recurrence_type = Column(
        SQLEnum(RecurrenceType),
        default=RecurrenceType.NONE,
        nullable=False
    )
    recurrence_end_date = Column(DateTime, nullable=True)
    
    # Metadata
    color = Column(String(7), nullable=True)  # Hex color code
    is_completed = Column(Boolean, default=False, nullable=False)
    created_from_voice = Column(Boolean, default=False, nullable=False)
    original_transcript = Column(Text, nullable=True)
    
    # Timestamps
    created_at = Column(DateTime, default=datetime.utcnow, nullable=False)
    updated_at = Column(
        DateTime,
        default=datetime.utcnow,
        onupdate=datetime.utcnow,
        nullable=False
    )
    
    # Relationships
    user = relationship("User", back_populates="events")
    
    def __repr__(self) -> str:
        return (
            f"<Event(id={self.id}, title={self.title}, "
            f"start={self.start_time}, user_id={self.user_id})>"
        )
    
    @property
    def duration_minutes(self) -> int:
        """Calculate event duration in minutes."""
        if self.all_day:
            return 1440  # 24 hours
        return int((self.end_time - self.start_time).total_seconds() / 60) 