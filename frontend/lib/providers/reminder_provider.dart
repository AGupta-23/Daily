import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/reminder.dart';
import '../services/notification_service.dart';
import 'api_provider.dart';

final reminderProvider =
    AsyncNotifierProvider<ReminderNotifier, List<Reminder>>(ReminderNotifier.new);

class ReminderNotifier extends AsyncNotifier<List<Reminder>> {
  Timer? _pollTimer;
  final _notifService = NotificationService();

  @override
  Future<List<Reminder>> build() async {
    ref.onDispose(() => _pollTimer?.cancel());
    _startPolling();
    return _fetchUpcoming();
  }

  void _startPolling() {
    _pollTimer = Timer.periodic(const Duration(seconds: 30), (_) async {
      final reminders = await _fetchUpcoming();
      state = AsyncData(reminders);
      await _notifService.scheduleReminders(reminders);
    });
  }

  Future<List<Reminder>> _fetchUpcoming() async {
    try {
      final api = ref.read(apiServiceProvider);
      return await api.getUpcomingReminders();
    } catch (e) {
      return [];
    }
  }

  Future<void> addReminder(ReminderRequest request) async {
    final api = ref.read(apiServiceProvider);
    final reminder = await api.createReminder(request);
    await _notifService.scheduleReminder(reminder);
    final current = state.value ?? [];
    state = AsyncData([...current, reminder]);
  }

  Future<void> snooze(String id, int minutes) async {
    final api = ref.read(apiServiceProvider);
    await api.snoozeReminder(id, minutes);
    state = AsyncData(await _fetchUpcoming());
  }

  Future<void> dismiss(String id) async {
    final api = ref.read(apiServiceProvider);
    await api.dismissReminder(id);
    await _notifService.cancelReminder(id);
    final current = state.value ?? [];
    state = AsyncData(current.where((r) => r.id != id).toList());
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = AsyncData(await _fetchUpcoming());
  }
}