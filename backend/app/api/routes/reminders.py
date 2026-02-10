"""
API routes for reminders.
"""
from fastapi import APIRouter

router = APIRouter()

@router.get("/reminders/test")
async def test_reminders():
    return {"message": "Reminder routes working"}
