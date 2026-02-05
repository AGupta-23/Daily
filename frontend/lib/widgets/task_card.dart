import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    final isCompleted = task.status == TaskStatus.completed;
    
    return Card(
      elevation: 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Status icon
              Icon(
                isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
                color: isCompleted ? Colors.green : Colors.grey,
              ),
              const SizedBox(width: 12),

              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Task content
                    Text(
                      task.content,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        decoration: isCompleted ? TextDecoration.lineThrough : null,
                        color: isCompleted ? Colors.grey[500] : Colors.grey[900],
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Task metadata
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: [
                        // Type badge
                        _buildBadge(
                          task.type.name,
                          _getTypeIcon(task.type),
                          _getTypeColor(task.type),
                        ),

                        // Priority badge
                        if (task.priority == TaskPriority.high || task.priority == TaskPriority.medium)
                          _buildBadge(
                            task.priority.name,
                            Icons.flag,
                            _getPriorityColor(task.priority),
                          ),

                        // Time badge
                        _buildBadge(
                          _formatTime(task.datetime),
                          Icons.access_time,
                          Colors.blue,
                        ),

                        // Duration badge
                        _buildBadge(
                          '${task.durationMinutes}m',
                          Icons.timer,
                          Colors.orange,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBadge(String label, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getTypeIcon(TaskType type) {
    switch (type) {
      case TaskType.task:
        return Icons.task_alt;
      case TaskType.reminder:
        return Icons.notifications;
      case TaskType.event:
        return Icons.event;
    }
  }

  Color _getTypeColor(TaskType type) {
    switch (type) {
      case TaskType.task:
        return Colors.blue;
      case TaskType.reminder:
        return Colors.purple;
      case TaskType.event:
        return Colors.green;
    }
  }

  Color _getPriorityColor(TaskPriority priority) {
    switch (priority) {
      case TaskPriority.high:
        return Colors.red;
      case TaskPriority.medium:
        return Colors.orange;
      case TaskPriority.low:
        return Colors.green;
    }
  }

  String _formatTime(DateTime datetime) {
    final hour = datetime.hour.toString().padLeft(2, '0');
    final minute = datetime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}