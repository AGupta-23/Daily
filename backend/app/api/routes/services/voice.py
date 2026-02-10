"""
Voice service for audio transcription using OpenAI Whisper.
"""
import os
import time
from pathlib import Path
from typing import Optional, Tuple
import whisper
from pydub import AudioSegment

from ..core.config import settings


class VoiceService:
    """Service for handling voice/audio processing."""
    
    def __init__(self):
        """Initialize the voice service."""
        self.model = None
        self.model_size = settings.whisper_model
        self._load_model()
    
    def _load_model(self) -> None:
        """Load Whisper model (lazy loading)."""
        if self.model is None:
            print(f"Loading Whisper model: {self.model_size}")
            self.model = whisper.load_model(self.model_size)
    
    async def transcribe_audio(
        self,
        file_path: str,
        language: Optional[str] = None
    ) -> Tuple[str, float, float]:
        """
        Transcribe audio file to text.
        
        Args:
            file_path: Path to audio file
            language: Optional language code (e.g., 'en', 'es')
            
        Returns:
            Tuple of (transcript, duration_seconds, processing_time_ms)
            
        Raises:
            FileNotFoundError: If audio file doesn't exist
            ValueError: If audio format is invalid
        """
        if not os.path.exists(file_path):
            raise FileNotFoundError(f"Audio file not found: {file_path}")
        
        # Get audio duration
        duration = self._get_audio_duration(file_path)
        
        # Transcribe
        start_time = time.time()
        
        result = self.model.transcribe(
            file_path,
            language=language,
            fp16=False,  # Use FP32 for better compatibility
            verbose=False
        )
        
        processing_time = (time.time() - start_time) * 1000
        
        transcript = result["text"].strip()
        detected_language = result.get("language", language or "unknown")
        
        return transcript, duration, processing_time
    
    def _get_audio_duration(self, file_path: str) -> float:
        """
        Get audio file duration in seconds.
        
        Args:
            file_path: Path to audio file
            
        Returns:
            Duration in seconds
        """
        try:
            audio = AudioSegment.from_file(file_path)
            return len(audio) / 1000.0  # Convert ms to seconds
        except Exception as e:
            print(f"Error getting audio duration: {e}")
            return 0.0
    
    def validate_audio_format(self, filename: str) -> bool:
        """
        Validate if audio format is supported.
        
        Args:
            filename: Name of the audio file
            
        Returns:
            True if format is supported, False otherwise
        """
        ext = Path(filename).suffix.lstrip('.').lower()
        return ext in settings.allowed_audio_formats
    
    def validate_file_size(self, file_size: int) -> bool:
        """
        Validate if file size is within limits.
        
        Args:
            file_size: File size in bytes
            
        Returns:
            True if size is acceptable, False otherwise
        """
        return file_size <= settings.max_upload_size_bytes
    
    async def convert_audio_format(
        self,
        input_path: str,
        output_format: str = "wav"
    ) -> str:
        """
        Convert audio file to a different format.
        
        Args:
            input_path: Path to input audio file
            output_format: Target format (e.g., 'wav', 'mp3')
            
        Returns:
            Path to converted file
        """
        audio = AudioSegment.from_file(input_path)
        
        output_path = str(Path(input_path).with_suffix(f".{output_format}"))
        audio.export(output_path, format=output_format)
        
        return output_path
    
    def cleanup_temp_file(self, file_path: str) -> None:
        """
        Remove temporary audio file.
        
        Args:
            file_path: Path to file to remove
        """
        try:
            if os.path.exists(file_path):
                os.remove(file_path)
        except Exception as e:
            print(f"Error removing temp file {file_path}: {e}")


# Global voice service instance
voice_service = VoiceService()