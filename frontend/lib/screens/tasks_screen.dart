import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/task_provider.dart';
import '../widgets/task_card.dart';
import '../models/task.dart';

class TasksScreen extends ConsumerStatefulWidget {
  const TasksScreen({super.key});

  @override
  ConsumerState<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends ConsumerState<TasksScreen> {
  String _selectedFilter = 'all';

  @override
  Widget build(BuildContext context) {
    final tasksAsync = ref.watch(tasksNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(tasksNotifierProvider.notifier).loadTasks();
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                _selectedFilter = value;
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'all', child: Text('All Tasks')),
              const PopupMenuItem(value: 'pending', child: Text('Pending')),
              const PopupMenuItem(value: 'completed', child: Text('Completed')),
              const PopupMenuItem(value: 'high', child: Text('High Priority')),
            ],
          ),
        ],
      ),
      body: tasksAsync.when(
        data: (tasks) {
          final filteredTasks = _filterTasks(tasks);

          if (filteredTasks.isEmpty) {
            return _buildEmptyState();
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16.0),
            itemCount: filteredTasks.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final task = filteredTasks[index];
              return Dismissible(
                key: Key(task.id),
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                confirmDismiss: (direction) async {
                  return await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Delete Task'),
                      content: const Text('Are you sure you want to delete this task?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context, true),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                          child: const Text('Delete'),
                        ),
                      ],
                    ),
                  );
                },
                onDismissed: (direction) async {
                  await ref.read(tasksNotifierProvider.notifier).deleteTask(task.id);
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Task deleted')),
                    );
                  }
                },
                child: InkWell(
                  onTap: () => _showTaskDetails(task),
                  child: TaskCard(task: task),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
                const SizedBox(height: 16),
                Text('Error loading tasks', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey[700])),
                const SizedBox(height: 8),
                Text(error.toString(), style: TextStyle(color: Colors.grey[600]), textAlign: TextAlign.center),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => ref.read(tasksNotifierProvider.notifier).loadTasks(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }

  List<Task> _filterTasks(List<Task> tasks) {
    switch (_selectedFilter) {
      case 'pending':
        return tasks.where((t) => t.status == TaskStatus.pending).toList();
      case 'completed':
        return tasks.where((t) => t.status == TaskStatus.completed).toList();
      case 'high':
        return tasks.where((t) => t.priority == TaskPriority.high).toList();
      default:
        return tasks;
    }
  }

  void _showTaskDetails(Task task) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 0.9,
        minChildSize: 0.4,
        expand: false,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(task.content, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                    IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
                  ],
                ),
                const SizedBox(height: 16),
                _buildDetailRow(Icons.category, 'Type', task.type.name),
                _buildDetailRow(Icons.access_time, 'Time', task.datetime.toString()),
                _buildDetailRow(Icons.timer, 'Duration', '${task.durationMinutes} minutes'),
                _buildDetailRow(
                  Icons.flag,
                  'Priority',
                  task.priority.name,
                  color: task.priority == TaskPriority.high ? Colors.red : task.priority == TaskPriority.medium ? Colors.orange : Colors.green,
                ),
                _buildDetailRow(
                  Icons.check_circle,
                  'Status',
                  task.status.name,
                  color: task.status == TaskStatus.completed ? Colors.green : Colors.grey,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: color ?? Colors.grey[600]),
          const SizedBox(width: 12),
          Text('$label: ', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey[700])),
          Text(value, style: TextStyle(color: color ?? Colors.grey[900], fontWeight: color != null ? FontWeight.w500 : FontWeight.normal)),
        ],
      ),
    );
  }

  void _showAddTaskDialog() {
    final contentController = TextEditingController();
    TaskType selectedType = TaskType.task;
    TaskPriority selectedPriority = TaskPriority.medium;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Add Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: contentController,
                decoration: const InputDecoration(labelText: 'Task content', border: OutlineInputBorder()),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<TaskType>(
                initialValue: selectedType,
                decoration: const InputDecoration(labelText: 'Type', border: OutlineInputBorder()),
                items: TaskType.values.map((type) => DropdownMenuItem(value: type, child: Text(type.name))).toList(),
                onChanged: (value) => setState(() => selectedType = value!),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<TaskPriority>(
                initialValue: selectedPriority,
                decoration: const InputDecoration(labelText: 'Priority', border: OutlineInputBorder()),
                items: TaskPriority.values.map((priority) => DropdownMenuItem(value: priority, child: Text(priority.name))).toList(),
                onChanged: (value) => setState(() => selectedPriority = value!),
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            ElevatedButton(
              onPressed: () async {
                if (contentController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter task content')));
                  return;
                }
                Navigator.pop(context);
                try {
                  await ref.read(tasksNotifierProvider.notifier).createTask(
                        content: contentController.text.trim(),
                        type: selectedType,
                        datetime: DateTime.now().add(const Duration(hours: 1)),
                        priority: selectedPriority,
                        flexible: true,
                        durationMinutes: 30,
                      );
                  if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Task created!')));
                } catch (e) {
                  if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
                }
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.task_alt, size: 80, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text('No tasks yet', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.grey[600])),
            const SizedBox(height: 8),
            Text('Add your first task using the + button', style: TextStyle(fontSize: 14, color: Colors.grey[500]), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}