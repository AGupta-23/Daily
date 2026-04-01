import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../models/reminder.dart';
import '../providers/reminder_provider.dart';

class RemindersScreen extends ConsumerWidget {
  const RemindersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remindersAsync = ref.watch(reminderProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminders'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(reminderProvider.notifier).refresh(),
          ),
        ],
      ),
      body: remindersAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (reminders) {
          if (reminders.isEmpty) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.notifications_none, size: 64, color: Colors.grey),
                  SizedBox(height: 12),
                  Text('No upcoming reminders', style: TextStyle(color: Colors.grey)),
                ],
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: reminders.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, i) => _ReminderCard(reminder: reminders[i]),
          );
        },
      ),
    );
  }
}

class _ReminderCard extends ConsumerWidget {
  final Reminder reminder;
  const _ReminderCard({required this.reminder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(reminderProvider.notifier);
    final time = DateFormat('MMM d · h:mm a').format(reminder.displayTime);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.notifications_active,
                    size: 16,
                    color: reminder.isOverdue ? Colors.red : Colors.deepPurple),
                const SizedBox(width: 6),
                Text(time,
                    style: TextStyle(
                        color: reminder.isOverdue ? Colors.red : Colors.grey[600],
                        fontSize: 12)),
                const Spacer(),
                _typeChip(reminder.type),
              ],
            ),
            const SizedBox(height: 8),
            Text(reminder.message, style: const TextStyle(fontSize: 15)),
            const SizedBox(height: 12),
            Row(
              children: [
                _snoozeButton(context, '5m', 5, notifier),
                const SizedBox(width: 8),
                _snoozeButton(context, '15m', 15, notifier),
                const SizedBox(width: 8),
                _snoozeButton(context, '1h', 60, notifier),
                const Spacer(),
                TextButton(
                  onPressed: () => notifier.dismiss(reminder.id),
                  child: const Text('Dismiss', style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _snoozeButton(
      BuildContext context, String label, int minutes, ReminderNotifier notifier) {
    return OutlinedButton(
      onPressed: () => notifier.snooze(reminder.id, minutes),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(label, style: const TextStyle(fontSize: 12)),
    );
  }

  Widget _typeChip(ReminderType type) {
    final label = type == ReminderType.verbal
        ? '🔊 Verbal'
        : type == ReminderType.both
            ? '🔔🔊 Both'
            : '🔔 Notif';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.deepPurple.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(label, style: const TextStyle(fontSize: 11)),
    );
  }
}