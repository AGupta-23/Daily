import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/task.dart';
import 'api_provider.dart';

final todayTasksProvider = FutureProvider<List<Task>>((ref) async {
  final api = ref.watch(apiServiceProvider);
  try {
    return await api.getTodayTasks();
  } catch (_) {
    return [];
  }
});

final tasksNotifierProvider =
    AsyncNotifierProvider<TasksNotifier, List<Task>>(TasksNotifier.new);

class TasksNotifier extends AsyncNotifier<List<Task>> {
  @override
  Future<List<Task>> build() => _load();

  Future<List<Task>> _load() async {
    final api = ref.read(apiServiceProvider);
    try {
      return await api.getTasks();
    } catch (_) {
      return [];
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = AsyncData(await _load());
  }

  Future<void> createTask({
    required String content,
    required TaskType type,
    required DateTime datetime,
    required TaskPriority priority,
    required bool flexible,
    required int durationMinutes,
  }) async {
    final api = ref.read(apiServiceProvider);
    final task = await api.createTask(TaskRequest(
      content: content,
      datetime: datetime,
      priority: priority,
      type: type,
      flexible: flexible,
      durationMinutes: durationMinutes,
    ));
    final current = state.value ?? [];
    state = AsyncData([...current, task]);
  }

  Future<void> updateTask(String id, TaskRequest request) async {
    final api = ref.read(apiServiceProvider);
    final updated = await api.updateTask(id, request);
    final current = state.value ?? [];
    state = AsyncData(current.map((t) => t.id == id ? updated : t).toList());
  }

  Future<void> deleteTask(String id) async {
    final api = ref.read(apiServiceProvider);
    await api.deleteTask(id);
    final current = state.value ?? [];
    state = AsyncData(current.where((t) => t.id != id).toList());
  }

  Future<void> completeTask(String id) async {
    final current = state.value ?? [];
    final task = current.firstWhere((t) => t.id == id);
    await updateTask(id, task.toRequest());
  }
}