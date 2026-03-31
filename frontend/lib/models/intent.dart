import 'package:freezed_annotation/freezed_annotation.dart';
import 'task.dart'; // Import for TaskType and TaskPriority

part 'intent.freezed.dart';
part 'intent.g.dart';

/// Single intent extracted from voice input
@freezed
class Intent with _$Intent {
  const factory Intent({
    required TaskType type,
    required String content,
    required DateTime datetime,
    required TaskPriority priority,
    required bool flexible,
    @JsonKey(name: 'duration_minutes') required int durationMinutes,
  }) = _Intent;

  factory Intent.fromJson(Map<String, dynamic> json) =>
      _$IntentFromJson(json);
}

/// Response from intent extraction API
@freezed
class IntentExtractionResponse with _$IntentExtractionResponse {
  const factory IntentExtractionResponse({
    required List<Intent> intents,
    @JsonKey(name: 'raw_text') required String rawText,
  }) = _IntentExtractionResponse;

  factory IntentExtractionResponse.fromJson(Map<String, dynamic> json) =>
      _$IntentExtractionResponseFromJson(json);
}

/// Extension methods for Intent model
extension IntentExtensions on Intent {
  /// Convert Intent to TaskRequest for API submission
  TaskRequest toTaskRequest() => TaskRequest(
        content: content,
        datetime: datetime,
        priority: priority,
        type: type,
        flexible: flexible,
        durationMinutes: durationMinutes,
      );
}