import 'package:intl/intl.dart';

/// Date and time utility functions
class DateUtils {
  // Prevent instantiation
  DateUtils._();

  /// Format date as "MMM dd, yyyy" (e.g., "Feb 04, 2026")
  static String formatDate(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  /// Format time as "h:mm a" (e.g., "3:30 PM")
  static String formatTime(DateTime date) {
    return DateFormat('h:mm a').format(date);
  }

  /// Format datetime as "MMM dd, h:mm a" (e.g., "Feb 04, 3:30 PM")
  static String formatDateTime(DateTime date) {
    return DateFormat('MMM dd, h:mm a').format(date);
  }

  /// Format date for API (ISO 8601 date only)
  static String formatDateForApi(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  /// Check if date is today
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  /// Check if date is tomorrow
  static bool isTomorrow(DateTime date) {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return date.year == tomorrow.year &&
        date.month == tomorrow.month &&
        date.day == tomorrow.day;
  }

  /// Get relative date string (Today, Tomorrow, or date)
  static String getRelativeDateString(DateTime date) {
    if (isToday(date)) {
      return 'Today';
    } else if (isTomorrow(date)) {
      return 'Tomorrow';
    } else {
      return formatDate(date);
    }
  }

  /// Get start of day
  static DateTime startOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  /// Get end of day
  static DateTime endOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59);
  }

  /// Get start of week (Monday)
  static DateTime startOfWeek(DateTime date) {
    final monday = date.subtract(Duration(days: date.weekday - 1));
    return startOfDay(monday);
  }

  /// Get end of week (Sunday)
  static DateTime endOfWeek(DateTime date) {
    final sunday = date.add(Duration(days: 7 - date.weekday));
    return endOfDay(sunday);
  }
}