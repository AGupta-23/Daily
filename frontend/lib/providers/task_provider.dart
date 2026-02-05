// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../models/task.dart';
// import 'api_provider.dart';

// /// Provider for today's tasks
// final todayTasksProvider = FutureProvider<List<Task>>((ref) async {
//   final apiService = ref.watch(apiServiceProvider);
//   return apiService.getTodayTasks();
// });

// /// Simple tasks provider for fetching all tasks
// final tasksProvider = FutureProvider<List<Task>>((ref) async {
//   final apiService = ref.watch(apiServiceProvider);
//   return apiService.getTasks();
// });

// /// Task operations notifier (for CRUD operations with proper state management)
// class TasksNotifier extends StateNotifier<AsyncValue<List<Task>>> {
//   final Ref ref;
  
//   TasksNotifier(this.ref) : super(const AsyncValue.loading()) {
//     loadTasks();
//   }

//   Future<void> loadTasks() async {
//     state = const AsyncValue.loading();
//     try {
//       final apiService = ref.read(apiServiceProvider);
//       final tasks = await apiService.getTasks();
//       state = AsyncValue.data(tasks);
//     } catch (e, stack) {
//       state = AsyncValue.error(e, stack);
//     }
//   }

//   Future<void> createTask({
//     required String content,
//     required TaskType type,
//     required DateTime datetime,
//     required TaskPriority priority,
//     required bool flexible,
//     required int durationMinutes,
//   }) async {
//     try {
//       final apiService = ref.read(apiServiceProvider);
      
//       final request = TaskRequest(
//         content: content,
//         type: type,
//         datetime: datetime,
//         priority: priority,
//         flexible: flexible,
//         durationMinutes: durationMinutes,
//       );
      
//       await apiService.createTask(request);
//       await loadTasks();
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<void> updateTask(String id, TaskRequest request) async {
//     try {
//       final apiService = ref.read(apiServiceProvider);
//       await apiService.updateTask(id, request);
//       await loadTasks();
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<void> deleteTask(String id) async {
//     try {
//       final apiService = ref.read(apiServiceProvider);
//       await apiService.deleteTask(id);
//       await loadTasks();
//     } catch (e) {
//       rethrow;
//     }
//   }
// }

// /// Provider for tasks with notifier
// final tasksNotifierProvider = StateNotifierProvider<TasksNotifier, AsyncValue<List<Task>>>((ref) {
//   return TasksNotifier(ref);
// });

// /// TEMPORARY: Mock data for testing without backend
// final tasksNotifierProvider = StateNotifierProvider<TasksNotifier, AsyncValue<List<Task>>>((ref) {
//   return TasksNotifier(ref);
// });

// class TasksNotifier extends StateNotifier<AsyncValue<List<Task>>> {
//   final Ref ref;
  
//   TasksNotifier(this.ref) : super(const AsyncValue.loading()) {
//     _loadMockTasks(); // Use mock data instead of API
//   }

//   // MOCK DATA - Remove when backend is ready
//   Future<void> _loadMockTasks() async {
//     await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    
//     state = AsyncValue.data([
//       Task(
//         id: '1',
//         content: 'Morning workout',
//         datetime: DateTime.now().add(const Duration(hours: 1)),
//         priority: TaskPriority.high,
//         type: TaskType.task,
//         status: TaskStatus.pending,
//         flexible: false,
//         durationMinutes: 45,
//         createdAt: DateTime.now(),
//       ),
//       Task(
//         id: '2',
//         content: 'Team meeting',
//         datetime: DateTime.now().add(const Duration(hours: 3)),
//         priority: TaskPriority.medium,
//         type: TaskType.event,
//         status: TaskStatus.pending,
//         flexible: false,
//         durationMinutes: 60,
//         createdAt: DateTime.now(),
//       ),
//       Task(
//         id: '3',
//         content: 'Call mom',
//         datetime: DateTime.now().add(const Duration(hours: 5)),
//         priority: TaskPriority.medium,
//         type: TaskType.reminder,
//         status: TaskStatus.pending,
//         flexible: true,
//         durationMinutes: 15,
//         createdAt: DateTime.now(),
//       ),
//     ]);
//   }

//   Future<void> loadTasks() async {
//     _loadMockTasks();
//   }

//   Future<void> createTask({
//     required String content,
//     required TaskType type,
//     required DateTime datetime,
//     required TaskPriority priority,
//     required bool flexible,
//     required int durationMinutes,
//   }) async {
//     // Mock create - add to list
//     final currentTasks = state.value ?? [];
//     final newTask = Task(
//       id: DateTime.now().millisecondsSinceEpoch.toString(),
//       content: content,
//       datetime: datetime,
//       priority: priority,
//       type: type,
//       status: TaskStatus.pending,
//       flexible: flexible,
//       durationMinutes: durationMinutes,
//       createdAt: DateTime.now(),
//     );
//     state = AsyncValue.data([...currentTasks, newTask]);
//   }

//   Future<void> updateTask(String id, TaskRequest request) async {
//     // Mock update
//     final currentTasks = state.value ?? [];
//     final updatedTasks = currentTasks.map((task) {
//       if (task.id == id) {
//         return Task(
//           id: task.id,
//           content: request.content,
//           datetime: request.datetime,
//           priority: request.priority,
//           type: request.type,
//           status: task.status,
//           flexible: request.flexible,
//           durationMinutes: request.durationMinutes,
//           createdAt: task.createdAt,
//         );
//       }
//       return task;
//     }).toList();
//     state = AsyncValue.data(updatedTasks);
//   }

//   Future<void> deleteTask(String id) async {
//     // Mock delete
//     final currentTasks = state.value ?? [];
//     state = AsyncValue.data(currentTasks.where((task) => task.id != id).toList());
//   }
// }

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/task.dart';
import 'api_provider.dart';

/// Provider for today's tasks (used on Home screen)
final todayTasksProvider = FutureProvider<List<Task>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 500));
  
  final now = DateTime.now();
  return [
    Task(
      id: '1',
      content: 'Meet Supervisor sir - Dr. Sivabalan AB02',
      datetime: DateTime(now.year, now.month, now.day, 9, 30),
      priority: TaskPriority.high,
      type: TaskType.event,
      status: TaskStatus.pending,
      flexible: false,
      durationMinutes: 60,
      createdAt: now,
    ),
    Task(
      id: '2',
      content: 'Meet Reviewer 1 and Reviewer 2 - Dr Manoj Kumar AB02 and Dr. Sheerin Kayenat Ma\'am in AB01',
      datetime: DateTime(now.year, now.month, now.day, 11, 0),
      priority: TaskPriority.high,
      type: TaskType.event,
      status: TaskStatus.pending,
      flexible: false,
      durationMinutes: 90,
      createdAt: now,
    ),
    Task(
      id: '3',
      content: 'Complete today\'s classes and make proper notes',
      datetime: DateTime(now.year, now.month, now.day, 17, 0),
      priority: TaskPriority.medium,
      type: TaskType.task,
      status: TaskStatus.pending,
      flexible: true,
      durationMinutes: 120,
      createdAt: now,
    ),
    Task(
      id: '4',
      content: 'Call Basketball team for practice matches',
      datetime: DateTime(now.year, now.month, now.day, 21, 30),
      priority: TaskPriority.medium,
      type: TaskType.reminder,
      status: TaskStatus.pending,
      flexible: true,
      durationMinutes: 30,
      createdAt: now,
    ),
  ];
});

/// Simple tasks provider (not used in mock mode)
final tasksProvider = FutureProvider<List<Task>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getTasks();
});

/// Provider for all tasks (used on Tasks screen and Calendar)
final tasksNotifierProvider = StateNotifierProvider<TasksNotifier, AsyncValue<List<Task>>>((ref) {
  return TasksNotifier(ref);
});

class TasksNotifier extends StateNotifier<AsyncValue<List<Task>>> {
  final Ref ref;
  
  TasksNotifier(this.ref) : super(const AsyncValue.loading()) {
    _loadMockTasks();
  }

  Future<void> _loadMockTasks() async {
    await Future.delayed(const Duration(seconds: 1));
    
    final now = DateTime.now();
    final tomorrow = now.add(const Duration(days: 1));
    
    state = AsyncValue.data([
      // TODAY'S TASKS
      Task(
        id: '1',
        content: 'Meet Supervisor sir - Dr. Sivabalan AB02',
        datetime: DateTime(now.year, now.month, now.day, 9, 30),
        priority: TaskPriority.high,
        type: TaskType.event,
        status: TaskStatus.pending,
        flexible: false,
        durationMinutes: 60,
        createdAt: now,
      ),
      Task(
        id: '2',
        content: 'Meet Reviewer 1 and Reviewer 2 - Dr Manoj Kumar AB02 and Dr. Sheerin Kayenat Ma\'am in AB01',
        datetime: DateTime(now.year, now.month, now.day, 11, 0),
        priority: TaskPriority.high,
        type: TaskType.event,
        status: TaskStatus.pending,
        flexible: false,
        durationMinutes: 90,
        createdAt: now,
      ),
      Task(
        id: '3',
        content: 'Complete today\'s classes and make proper notes',
        datetime: DateTime(now.year, now.month, now.day, 17, 0),
        priority: TaskPriority.medium,
        type: TaskType.task,
        status: TaskStatus.pending,
        flexible: true,
        durationMinutes: 120,
        createdAt: now,
      ),
      Task(
        id: '4',
        content: 'Call Basketball team for practice matches',
        datetime: DateTime(now.year, now.month, now.day, 21, 30),
        priority: TaskPriority.medium,
        type: TaskType.reminder,
        status: TaskStatus.pending,
        flexible: true,
        durationMinutes: 30,
        createdAt: now,
      ),
      
      // TOMORROW'S TASKS (for testing upcoming)
      Task(
        id: '5',
        content: 'Morning workout',
        datetime: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 7, 0),
        priority: TaskPriority.low,
        type: TaskType.task,
        status: TaskStatus.pending,
        flexible: true,
        durationMinutes: 45,
        createdAt: now,
      ),
      Task(
        id: '6',
        content: 'Submit project report',
        datetime: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 14, 0),
        priority: TaskPriority.high,
        type: TaskType.task,
        status: TaskStatus.pending,
        flexible: false,
        durationMinutes: 30,
        createdAt: now,
      ),
    ]);
  }

  Future<void> loadTasks() async {
    _loadMockTasks();
  }

  Future<void> createTask({
    required String content,
    required TaskType type,
    required DateTime datetime,
    required TaskPriority priority,
    required bool flexible,
    required int durationMinutes,
  }) async {
    final currentTasks = state.value ?? [];
    final newTask = Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: content,
      datetime: datetime,
      priority: priority,
      type: type,
      status: TaskStatus.pending,
      flexible: flexible,
      durationMinutes: durationMinutes,
      createdAt: DateTime.now(),
    );
    state = AsyncValue.data([...currentTasks, newTask]);
  }

  Future<void> updateTask(String id, TaskRequest request) async {
    final currentTasks = state.value ?? [];
    final updatedTasks = currentTasks.map((task) {
      if (task.id == id) {
        return Task(
          id: task.id,
          content: request.content,
          datetime: request.datetime,
          priority: request.priority,
          type: request.type,
          status: task.status,
          flexible: request.flexible,
          durationMinutes: request.durationMinutes,
          createdAt: task.createdAt,
        );
      }
      return task;
    }).toList();
    state = AsyncValue.data(updatedTasks);
  }

  Future<void> deleteTask(String id) async {
    final currentTasks = state.value ?? [];
    state = AsyncValue.data(currentTasks.where((task) => task.id != id).toList());
  }
}