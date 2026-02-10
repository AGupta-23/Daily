"""
Application configuration module using Pydantic Settings.
Manages environment variables and application settings.
"""
import os
from pathlib import Path
from typing import List
from pydantic_settings import BaseSettings, SettingsConfigDict
from pydantic import Field, field_validator

# Find .env file in parent directory
BASE_DIR = Path(__file__).resolve().parent.parent.parent
ENV_FILE = BASE_DIR / ".env"

class Settings(BaseSettings):
    """Application settings loaded from environment variables."""
    
    model_config = SettingsConfigDict(
        env_file=str(ENV_FILE),
        env_file_encoding="utf-8",
        case_sensitive=False,
        extra="allow"
    )
    
    # Database
    database_url: str = Field(
        default="sqlite+aiosqlite:///./daily.db",
        description="Database connection URL"
    )
    
    # API Keys
    openai_api_key: str = Field(default="", description="OpenAI API key")
    anthropic_api_key: str = Field(default="", description="Anthropic API key")
    
    # AI Configuration
    llm_provider: str = Field(
        default="openai",
        description="LLM provider (openai or anthropic)"
    )
    llm_model: str = Field(
        default="gpt-4-turbo-preview",
        description="Model name to use"
    )
    whisper_model: str = Field(
        default="base",
        description="Whisper model size"
    )
    
    # Security
    secret_key: str = Field(
        default="dev-secret-key-change-in-production",
        description="Secret key for JWT tokens"
    )
    algorithm: str = Field(default="HS256", description="JWT algorithm")
    access_token_expire_minutes: int = Field(default=30)
    
    # Server
    host: str = Field(default="0.0.0.0", description="Server host")
    port: int = Field(default=8000, description="Server port")
    debug: bool = Field(default=True, description="Debug mode")
    
    # CORS
    allowed_origins: str = Field(
        default="http://localhost:3000,http://localhost:8000",
        description="Comma-separated list of allowed origins"
    )
    
    # File Upload
    max_upload_size_mb: int = Field(default=10)
    allowed_audio_formats: str = Field(default="wav,mp3,m4a,ogg,webm")
    
    @field_validator("allowed_origins")
    def parse_origins(cls, v):
        if isinstance(v, list):
            return v
        return [origin.strip() for origin in v.split(",") if origin.strip()]
    
    @field_validator("allowed_audio_formats")
    def parse_audio_formats(cls, v):
        if isinstance(v, list):
            return v
        return [fmt.strip().lower() for fmt in v.split(",") if fmt.strip()]
    
    @property
    def max_upload_size_bytes(self) -> int:
        return self.max_upload_size_mb * 1024 * 1024
    
    def validate_api_keys(self) -> None:
        if self.llm_provider == "openai" and not self.openai_api_key:
            raise ValueError("OPENAI_API_KEY is required when using OpenAI provider")
        if self.llm_provider == "anthropic" and not self.anthropic_api_key:
            raise ValueError("ANTHROPIC_API_KEY is required when using Anthropic provider")


# Global settings instance
settings = Settings()
