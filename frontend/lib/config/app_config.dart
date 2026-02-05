/// Application-wide configuration and constants
class AppConfig {
  // Prevent instantiation
  AppConfig._();

  // API Configuration
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:8000',
  );

  // API Timeouts
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 60); // Longer for audio uploads

  // Retry Configuration
  static const int maxRetries = 3;
  static const Duration retryDelay = Duration(seconds: 2);

  // Audio Configuration
  static const int audioSampleRate = 16000; // 16kHz for good quality
  static const int audioBitRate = 128000; // 128kbps
  static const int maxRecordingDuration = 300; // 5 minutes in seconds

  // Cache Configuration
  static const Duration cacheExpiration = Duration(hours: 1);

  // App Information
  static const String appName = 'Daily';
  static const String appVersion = '1.0.0';
}