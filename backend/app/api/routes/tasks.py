"""
API routes for task management.
"""
from fastapi import APIRouter

router = APIRouter()

@router.get("/tasks/test")
async def test_tasks():
    return {"message": "Task routes working"}
