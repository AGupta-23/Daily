"""
API routes for event management.
"""
from fastapi import APIRouter

router = APIRouter()

@router.get("/events/test")
async def test_events():
    return {"message": "Event routes working"}
