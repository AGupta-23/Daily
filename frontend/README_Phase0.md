# Daily - Flutter Frontend (Phase 0)

A voice-first productivity app for people with ADHD, built with Flutter and clean architecture principles.

## 🚀 Phase 0 - Foundation Complete

Phase 0 establishes the core infrastructure needed for the Daily app:

### ✅ What's Implemented

1. **Project Structure**
   - Clean architecture with proper separation of concerns
   - Organized folders: models, services, providers, screens, widgets, utils
   - Configuration management with AppConfig

2. **State Management**
   - Riverpod for reactive state management
   - Providers for API service and tasks
   - AsyncValue handling for loading/error states

3. **API Integration**
   - Dio-based HTTP client with retry logic
   - Comprehensive error handling with custom exceptions
   - API service with all Phase 1-2 endpoints
   - Automatic request/response logging

4. **Data Models**
   - Task, Event, Intent models with Freezed
   - JSON serialization/deserialization
   - Extension methods for common operations
   - Type-safe enums for priority, status, type

5. **Navigation**
   - Bottom navigation bar with 4 main screens
   - Material 3 design
   - Smooth screen transitions

6. **Basic UI**
   - Home screen with voice input button
   - Placeholder screens for Tasks, Calendar, Settings
   - TaskCard widget for displaying tasks
   - Empty and error states

## 📁 Project Structure

```
lib/
├── config/
│   └── app_config.dart          # App configuration & constants
├── core/
│   ├── api_client.dart          # HTTP client wrapper with Dio
│   └── exceptions.dart          # Custom exception classes
├── models/
│   ├── task.dart                # Task model with JSON
│   ├── event.dart               # Event model
│   ├── intent.dart              # Intent extraction models
│   └── api_response.dart        # API response models
├── providers/
│   ├── api_provider.dart        # API service provider
│   └── task_provider.dart       # Task state management
├── screens/
│   ├── home_screen.dart         # Main dashboard
│   ├── tasks_screen.dart        # Task list (placeholder)
│   ├── calendar_screen.dart     # Calendar view (placeholder)
│   ├── settings_screen.dart     # App settings
│   └── voice_input_screen.dart  # Voice recording (placeholder)
├── services/
│   └── api_service.dart         # API service layer
├── utils/
│   └── date_utils.dart          # Date formatting utilities
├── widgets/
│   └── task_card.dart           # Reusable task card
└── main.dart                     # App entry point
```

## 🛠️ Setup Instructions

### Prerequisites

- Flutter SDK (3.2.0 or later)
- Dart SDK (3.2.0 or later)
- Android Studio / VS Code with Flutter extensions
- Android/iOS emulator or physical device

### Installation

1. **Clone the repository**
   ```bash
   cd frontend
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code** (for Freezed models)
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Configure API endpoint** (optional)
   
   By default, the app uses `http://localhost:8000`. To change:
   
   ```bash
   # Run with custom API URL
   flutter run --dart-define=API_BASE_URL=http://your-api-url:8000
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

## 🧪 Testing Without Backend

The app handles backend connection gracefully with error messages. You can test the UI:

1. **Test Navigation**: Navigate between tabs using bottom navigation
2. **Test UI States**: View loading indicators and error states
3. **Mock Data**: Modify providers to return mock data for testing

### Example: Mock Tasks for Testing

In `lib/providers/task_provider.dart`, temporarily modify:

```dart
Future<List<Task>> getTodayTasks() async {
  // Mock data for testing
  return [
    Task(
      id: 'test_1',
      content: 'Sample task',
      datetime: DateTime.now(),
      priority: TaskPriority.high,
      type: TaskType.task,
      status: TaskStatus.pending,
      flexible: false,
      durationMinutes: 30,
      createdAt: DateTime.now(),
    ),
  ];
}
```

## 📝 Key Features

### API Service (`lib/services/api_service.dart`)

- ✅ Health check endpoint
- ✅ Voice transcription (ready for Phase 1)
- ✅ Intent extraction (ready for Phase 1)
- ✅ Task CRUD operations
- ✅ Event management
- ✅ Timeline view
- ✅ Automatic retry on network errors
- ✅ Comprehensive error handling

### Error Handling

The app includes robust error handling:

- Network errors (no connection, timeouts)
- Server errors (5xx)
- Client errors (4xx)
- Validation errors (422)
- Authentication errors (401)
- Not found errors (404)
- Custom error messages per exception type

### State Management

Using Riverpod for:

- API service singleton
- Task list state with loading/error
- Today's tasks (FutureProvider)
- Upcoming tasks (FutureProvider)
- Individual task by ID

## 🔧 Configuration

### API Timeouts

Adjust in `lib/config/app_config.dart`:

```dart
static const Duration connectTimeout = Duration(seconds: 30);
static const Duration receiveTimeout = Duration(seconds: 30);
static const Duration sendTimeout = Duration(seconds: 60);
```

### Retry Logic

```dart
static const int maxRetries = 3;
static const Duration retryDelay = Duration(seconds: 2);
```

### Audio Settings (for Phase 1)

```dart
static const int audioSampleRate = 16000;
static const int audioBitRate = 128000;
static const int maxRecordingDuration = 300; // seconds
```

## 🎨 UI/UX Design

- **Material 3 Design**: Modern, clean interface
- **Bottom Navigation**: Quick access to main screens
- **Card-based Layout**: Clean separation of content
- **Priority Indicators**: Color-coded flags for task priority
- **Responsive Design**: Adapts to different screen sizes
- **ADHD-Friendly**: Minimal clutter, clear visual hierarchy

## 📱 Screens Overview

### Home Screen
- Welcome message with time-based greeting
- Large voice input button
- Today's tasks preview (up to 3 tasks)
- Pull-to-refresh capability

### Tasks Screen (Placeholder)
- Will show grouped task lists in Phase 2
- Today / Upcoming / Later sections
- Swipe actions for complete/delete

### Calendar Screen (Placeholder)
- Will show week/day views in Phase 2
- Color-coded by priority
- Combined tasks and events

### Settings Screen
- App version info
- API configuration display
- Placeholders for future settings

## 🚧 Next Steps (Phase 1)

The foundation is ready for Phase 1 implementation:

1. **Audio Recording**
   - Implement record button with visual feedback
   - Handle audio permissions (iOS/Android)
   - Record and save audio files

2. **Transcription Flow**
   - Upload audio to backend
   - Display transcription result
   - Allow editing before confirmation

3. **Intent Confirmation**
   - Show extracted intents as cards
   - Allow editing each intent
   - Create tasks from confirmed intents

## 🐛 Troubleshooting

### Build Runner Issues
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Import Errors
Make sure generated files exist:
```bash
find lib -name "*.g.dart"
find lib -name "*.freezed.dart"
```

### API Connection Issues
- Check if backend is running on http://localhost:8000
- Try `flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8000` for Android emulator
- Check `AppConfig.apiBaseUrl` in logs

### Hot Reload Not Working
```bash
flutter clean
flutter run
```

## 📚 Dependencies

### Core
- `flutter_riverpod` - State management
- `dio` - HTTP client
- `freezed` - Immutable models
- `json_annotation` - JSON serialization

### UI
- `intl` - Date formatting
- Material 3 - Design system

### Code Generation
- `build_runner` - Code generation
- `freezed` - Model generation
- `json_serializable` - JSON generation
- `riverpod_generator` - Provider generation

## 💡 Development Tips

1. **Use Logger**: All API calls are logged automatically
2. **Check Providers**: Use Riverpod DevTools for debugging state
3. **Error Handling**: Custom exceptions provide clear error messages
4. **Hot Reload**: Changes to UI reflect immediately
5. **Code Generation**: Run build_runner after model changes

## 📄 License

This project is part of a portfolio/learning project.

---

**Phase 0 Status**: ✅ Complete and ready for Phase 1 development