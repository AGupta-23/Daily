import 'dart:io';
import 'package:dio/dio.dart';
import '../core/api_client.dart';
import '../models/api_response.dart';
import '../models/task.dart';
import '../models/event.dart';
import '../models/intent.dart';

/// Main API service for Daily app
class ApiService {
  final ApiClient _client;

  ApiService({ApiClient? client}) : _client = client ?? ApiClient();

  // ========== Phase 0: Health Check ==========

  /// Check API health status
  Future<HealthResponse> checkHealth() async {
    final response = await _client.get('/health');
    return HealthResponse.fromJson(response.data as Map<String, dynamic>);
  }

  // ========== Phase 1: Voice Input ==========

  /// Transcribe audio file to text
  /// 
  /// [audioFile] - Audio file to transcribe (WAV or M4A format)
  /// Returns transcription with confidence score
  Future<TranscriptionResponse> transcribeAudio(File audioFile) async {
    // Create multipart form data
    final formData = FormData.fromMap({
      'audio_file': await MultipartFile.fromFile(
        audioFile.path,
        filename: audioFile.path.split('/').last,
      ),
    });

    final response = await _client.post(
      '/api/voice/transcribe',
      data: formData,
      options: Options(
        contentType: 'multipart/form-data',
      ),
    );

    return TranscriptionResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  /// Extract intents from transcribed text
  /// 
  /// [text] - Transcribed text from voice input
  /// Returns list of extracted intents (tasks, reminders, events)
  Future<IntentExtractionResponse> extractIntent(String text) async {
    final response = await _client.post(
      '/api/voice/extract-intent',
      data: {'text': text},
    );

    return IntentExtractionResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  /// Create a new task
  /// 
  /// [request] - Task details to create
  /// Returns created task with ID
  Future<Task> createTask(TaskRequest request) async {
    final response = await _client.post(
      '/api/tasks',
      data: request.toJson(),
    );

    return Task.fromJson(response.data as Map<String, dynamic>);
  }

  /// Create multiple tasks in batch
  /// 
  /// Useful for creating tasks from multiple intents
  Future<List<Task>> createTasks(List<TaskRequest> requests) async {
    final tasks = <Task>[];
    
    // Create tasks sequentially to maintain order
    // In production, consider parallel execution with error handling
    for (final request in requests) {
      try {
        final task = await createTask(request);
        tasks.add(task);
      } catch (e) {
        // Log error but continue with other tasks
        print('Failed to create task: ${request.content}. Error: $e');
        rethrow; // Or handle gracefully based on requirements
      }
    }
    
    return tasks;
  }

  // ========== Phase 2: Task Management ==========

  /// Get list of tasks with optional filters
  /// 
  /// [date] - Filter by specific date
  /// [status] - Filter by status (pending, completed, cancelled)
  /// [priority] - Filter by priority (low, medium, high)
  Future<List<Task>> getTasks({
    DateTime? date,
    TaskStatus? status,
    TaskPriority? priority,
  }) async {
    final queryParams = <String, dynamic>{};
    
    if (date != null) {
      queryParams['date'] = date.toIso8601String().split('T')[0];
    }
    if (status != null) {
      queryParams['status'] = status.name;
    }
    if (priority != null) {
      queryParams['priority'] = priority.name;
    }

    final response = await _client.get(
      '/api/tasks',
      queryParameters: queryParams,
    );

    final data = response.data as Map<String, dynamic>;
    final tasksList = data['tasks'] as List<dynamic>;
    
    return tasksList
        .map((json) => Task.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  /// Get a single task by ID
  Future<Task> getTask(String id) async {
    final response = await _client.get('/api/tasks/$id');
    return Task.fromJson(response.data as Map<String, dynamic>);
  }

  /// Update an existing task
  /// 
  /// [id] - Task ID to update
  /// [request] - Updated task data (partial updates allowed)
  Future<Task> updateTask(String id, TaskRequest request) async {
    final response = await _client.put(
      '/api/tasks/$id',
      data: request.toJson(),
    );

    return Task.fromJson(response.data as Map<String, dynamic>);
  }

  /// Delete a task
  Future<DeleteResponse> deleteTask(String id) async {
    final response = await _client.delete('/api/tasks/$id');
    return DeleteResponse.fromJson(response.data as Map<String, dynamic>);
  }

  // ========== Phase 2: Event Management ==========

  /// Get list of events within date range
  /// 
  /// [startDate] - Start of date range
  /// [endDate] - End of date range
  Future<List<Event>> getEvents({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final queryParams = {
      'start_date': startDate.toIso8601String().split('T')[0],
      'end_date': endDate.toIso8601String().split('T')[0],
    };

    final response = await _client.get(
      '/api/events',
      queryParameters: queryParams,
    );

    final data = response.data as Map<String, dynamic>;
    final eventsList = data['events'] as List<dynamic>;
    
    return eventsList
        .map((json) => Event.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  // ========== Phase 2: Timeline View ==========

  /// Get timeline view (combined tasks and events)
  /// 
  /// [startDate] - Start of date range
  /// [endDate] - End of date range
  Future<TimelineResponse> getTimeline({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final queryParams = {
      'start_date': startDate.toIso8601String().split('T')[0],
      'end_date': endDate.toIso8601String().split('T')[0],
    };

    final response = await _client.get(
      '/api/timeline',
      queryParameters: queryParams,
    );

    return TimelineResponse.fromJson(response.data as Map<String, dynamic>);
  }

  // ========== Helper Methods ==========

  /// Get tasks for today
  Future<List<Task>> getTodayTasks() async {
    return getTasks(date: DateTime.now());
  }

  /// Get upcoming tasks (next 7 days)
  Future<List<Task>> getUpcomingTasks() async {
    final now = DateTime.now();
    final endDate = now.add(const Duration(days: 7));
    
    // Backend doesn't have date range for tasks, so we filter client-side
    final allTasks = await getTasks(status: TaskStatus.pending);
    
    return allTasks.where((task) {
      return task.datetime.isAfter(now) && task.datetime.isBefore(endDate);
    }).toList();
  }

  /// Mark task as completed
  Future<Task> completeTask(Task task) async {
    final request = task.toRequest();
    // Note: Need to update the API contract to support status updates
    // For now, we'll update the entire task
    return updateTask(task.id, request);
  }

  /// Close the API client
  void dispose() {
    _client.close();
  }
}