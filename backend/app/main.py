"""
Main FastAPI application entry point.
"""
from contextlib import asynccontextmanager
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse

from .core.config import settings
from .core.database import init_db, close_db
from .api.routes import events, reminders, tasks, voice


@asynccontextmanager
async def lifespan(app: FastAPI):
    """
    Lifespan context manager for startup and shutdown events.
    """
    # Startup
    print("🚀 Starting Daily API...")
    print(f"📊 Database: {settings.database_url}")
    print(f"🤖 LLM Provider: {settings.llm_provider}")
    print(f"🎤 Whisper Model: {settings.whisper_model}")
    
    # Initialize database
    await init_db()
    print("✅ Database initialized")
    
    # Validate API keys
    try:
        settings.validate_api_keys()
        print("✅ API keys validated")
    except ValueError as e:
        print(f"⚠️  Warning: {e}")
    
    yield
    
    # Shutdown
    print("🛑 Shutting down Daily API...")
    await close_db()
    print("✅ Database connections closed")


# Create FastAPI app
app = FastAPI(
    title="Daily API",
    description="Backend API for Daily - AI-powered, voice-first productivity app for people with ADHD",
    version="1.0.0",
    lifespan=lifespan,
    docs_url="/docs" if settings.debug else None,
    redoc_url="/redoc" if settings.debug else None,
)

# Configure CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.allowed_origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


# Health check endpoint
@app.get("/", tags=["Health"])
async def root():
    """Root endpoint - health check."""
    return {
        "status": "healthy",
        "service": "Daily API",
        "version": "1.0.0",
        "message": "Welcome to Daily - Your AI-powered productivity assistant"
    }


@app.get("/health", tags=["Health"])
async def health_check():
    """Detailed health check endpoint."""
    return {
        "status": "healthy",
        "timestamp": "2024-01-01T00:00:00Z",
        "services": {
            "database": "connected",
            "llm": settings.llm_provider,
            "whisper": settings.whisper_model
        },
        "environment": "development" if settings.debug else "production"
    }


# Exception handlers
@app.exception_handler(404)
async def not_found_handler(request, exc):
    """Handle 404 errors."""
    return JSONResponse(
        status_code=404,
        content={
            "error": "Not Found",
            "message": f"The requested resource was not found: {request.url.path}",
            "path": request.url.path
        }
    )


@app.exception_handler(500)
async def internal_error_handler(request, exc):
    """Handle 500 errors."""
    return JSONResponse(
        status_code=500,
        content={
            "error": "Internal Server Error",
            "message": "An unexpected error occurred. Please try again later.",
            "details": str(exc) if settings.debug else None
        }
    )


# Include routers
app.include_router(voice.router, prefix="/api/v1", tags=["Voice"])
app.include_router(tasks.router, prefix="/api/v1", tags=["Tasks"])
app.include_router(events.router, prefix="/api/v1", tags=["Events"])
app.include_router(reminders.router, prefix="/api/v1", tags=["Reminders"])


if __name__ == "__main__":
    import uvicorn
    
    uvicorn.run(
        "app.main:app",
        host=settings.host,
        port=settings.port,
        reload=settings.debug,
        log_level="info" if settings.debug else "warning"
    )