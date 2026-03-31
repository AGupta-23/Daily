"""
API routes for voice/audio processing.
"""
from fastapi import APIRouter

router = APIRouter()

@router.get("/voice/test")
async def test_voice():
    return {"message": "Voice routes working"}
