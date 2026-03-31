import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;
import '../models/reminder.dart';

// ── Constants ─────────────────────────────────────────────────────────────────

const String _channelId = 'daily_reminders';
const String _channelName = 'Daily Reminders';
const String _channelDesc = 'Reminders for your tasks and events';

const String _prefVerbalEnabled = 'verbal_reminders_enabled';
const String _prefDndStart = 'dnd_start_hour';
const String _prefDndEnd = 'dnd_end_hour';

// ── Notification tap stream (global so it survives widget rebuilds) ───────────
final _tapStreamController = StreamController<String>.broadcast();

// ── Notification Service ──────────────────────────────────────────────────────

/// Manages local notifications and verbal (TTS) reminders.
/// Call [initialize] once at app startup in main.dart.
class NotificationService {
  // Singleton
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();
  final FlutterTts _tts = FlutterTts();

  bool _initialized = false;

  // ── Initialization ──────────────────────────────────────────────────────────

  /// Call once in main() before runApp.
  Future<void> initialize() async {
    if (_initialized) return;

    // Required for scheduled notifications
    tz_data.initializeTimeZones();

    await _initNotifications();
    await _initTts();

    _initialized = true;
    debugPrint('[NotificationService] Initialized');
  }

  Future<void> _initNotifications() async {
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    // Create Android notification channel (required for Android 8+)
    const channel = AndroidNotificationChannel(
      _channelId,
      _channelName,
      description: _channelDesc,
      importance: Importance.high,
      playSound: true,
    );

    final androidPlugin = _notifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();

    if (androidPlugin != null) {
      await androidPlugin.createNotificationChannel(channel);
    }
  }

  Future<void> _initTts() async {
    await _tts.setLanguage('en-US');
    await _tts.setSpeechRate(0.5);
    await _tts.setVolume(1.0);
    await _tts.setPitch(1.0);
  }

  // ── Permissions ─────────────────────────────────────────────────────────────

  /// Request notification permissions.
  /// Returns true if granted.
  Future<bool> requestPermissions() async {
    final androidPlugin = _notifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();

    if (androidPlugin != null) {
      final granted = await androidPlugin.requestNotificationsPermission();
      return granted ?? false;
    }

    final iosPlugin = _notifications
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>();

    if (iosPlugin != null) {
      final granted = await iosPlugin.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      return granted ?? false;
    }

    return true;
  }

  // ── Schedule Notifications ──────────────────────────────────────────────────

  /// Schedule a local notification for a reminder.
  Future<void> scheduleReminder(Reminder reminder) async {
    if (!_initialized) await initialize();

    final scheduledTime = reminder.snoozedUntil ?? reminder.remindAt;

    // Don't schedule if time is already in the past
    if (scheduledTime.isBefore(DateTime.now())) {
      debugPrint('[NotificationService] Skipping past reminder: ${reminder.id}');
      return;
    }

    const androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDesc,
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _notifications.zonedSchedule(
      _idFromString(reminder.id),
      'Daily Reminder',
      reminder.message,
      tz.TZDateTime.from(scheduledTime, tz.local),
      details,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: reminder.id,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );

    debugPrint(
        '[NotificationService] Scheduled ${reminder.id} at $scheduledTime');
  }

  /// Schedule multiple reminders at once.
  Future<void> scheduleReminders(List<Reminder> reminders) async {
    for (final reminder in reminders) {
      try {
        await scheduleReminder(reminder);
      } catch (e) {
        debugPrint(
            '[NotificationService] Failed to schedule ${reminder.id}: $e');
      }
    }
  }

  // ── Show Immediate Notification ─────────────────────────────────────────────

  /// Show a notification immediately.
  Future<void> showNow({
    required String id,
    required String title,
    required String body,
    String? payload,
  }) async {
    if (!_initialized) await initialize();

    if (await _isDoNotDisturb()) {
      debugPrint('[NotificationService] DND active, suppressing notification');
      return;
    }

    const androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDesc,
      importance: Importance.high,
      priority: Priority.high,
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: DarwinNotificationDetails(),
    );

    await _notifications.show(
      _idFromString(id),
      title,
      body,
      details,
      payload: payload,
    );
  }

  // ── Cancel Notifications ────────────────────────────────────────────────────

  /// Cancel a scheduled notification by reminder ID.
  Future<void> cancelReminder(String reminderId) async {
    await _notifications.cancel(_idFromString(reminderId));
    debugPrint('[NotificationService] Cancelled: $reminderId');
  }

  /// Cancel all scheduled notifications.
  Future<void> cancelAll() async {
    await _notifications.cancelAll();
    debugPrint('[NotificationService] Cancelled all notifications');
  }

  // ── Text-to-Speech ──────────────────────────────────────────────────────────

  /// Speak a reminder message aloud.
  /// Respects verbal reminders toggle and DND hours.
  Future<void> speakReminder(String message) async {
    if (!await isVerbalEnabled()) {
      debugPrint('[NotificationService] Verbal reminders disabled');
      return;
    }

    if (await _isDoNotDisturb()) {
      debugPrint('[NotificationService] DND active, suppressing TTS');
      return;
    }

    try {
      await _tts.speak(message);
      debugPrint('[NotificationService] Speaking: $message');
    } catch (e) {
      debugPrint('[NotificationService] TTS error: $e');
    }
  }

  /// Stop speaking immediately.
  Future<void> stopSpeaking() async {
    await _tts.stop();
  }

  // ── Settings ────────────────────────────────────────────────────────────────

  Future<void> setVerbalEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefVerbalEnabled, enabled);
  }

  Future<bool> isVerbalEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_prefVerbalEnabled) ?? true;
  }

  /// Set DND hours. e.g. startHour=22, endHour=7 means 10 PM to 7 AM.
  Future<void> setDoNotDisturbHours(int startHour, int endHour) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_prefDndStart, startHour);
    await prefs.setInt(_prefDndEnd, endHour);
  }

  Future<List<int>> getDoNotDisturbHours() async {
    final prefs = await SharedPreferences.getInstance();
    return [
      prefs.getInt(_prefDndStart) ?? 22,
      prefs.getInt(_prefDndEnd) ?? 7,
    ];
  }

  // ── Notification Tap Stream ─────────────────────────────────────────────────

  /// Listen to this stream to navigate when a notification is tapped.
  /// Emits the reminder ID that was tapped.
  Stream<String> get onNotificationTapped => _tapStreamController.stream;

  // ── Private Helpers ─────────────────────────────────────────────────────────

  Future<bool> _isDoNotDisturb() async {
    final hours = await getDoNotDisturbHours();
    final startHour = hours[0];
    final endHour = hours[1];
    final currentHour = DateTime.now().hour;

    // Overnight range e.g. 22:00 → 07:00
    if (startHour > endHour) {
      return currentHour >= startHour || currentHour < endHour;
    }
    // Same-day range e.g. 13:00 → 15:00
    return currentHour >= startHour && currentHour < endHour;
  }

  /// Convert string ID to stable int for notification ID.
  int _idFromString(String id) => id.hashCode.abs() % 100000;

  void _onNotificationTapped(NotificationResponse response) {
    final reminderId = response.payload;
    if (reminderId != null) {
      debugPrint('[NotificationService] Tapped: $reminderId');
      _tapStreamController.add(reminderId);
    }
  }
}