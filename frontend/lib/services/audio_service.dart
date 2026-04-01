import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

// ── Custom Exceptions (defined first so AudioService can use them) ────────────

class AudioPermissionException implements Exception {
  final String message;
  AudioPermissionException([this.message = 'Microphone permission denied']);

  @override
  String toString() => 'AudioPermissionException: $message';
}

class AudioRecordingException implements Exception {
  final String message;
  AudioRecordingException([this.message = 'Recording failed']);

  @override
  String toString() => 'AudioRecordingException: $message';
}

// ── Audio Service ─────────────────────────────────────────────────────────────

/// Handles all audio recording functionality.
/// Used by push-to-talk (VoiceInputScreen) and
/// long-form recording (VoiceNotesScreen in Phase 4).
class AudioService {
  final AudioRecorder _recorder = AudioRecorder();

  bool _isRecording = false;
  String? _currentPath;

  bool get isRecording => _isRecording;
  String? get currentPath => _currentPath;

  // ── Permission ──────────────────────────────────────────────────────────────

  /// Request microphone permission.
  /// Returns true if granted, false if denied.
  Future<bool> requestPermission() async {
    final status = await Permission.microphone.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      debugPrint('[AudioService] Microphone permission denied: $status');
      return false;
    }
    return status.isGranted;
  }

  /// Check if microphone permission is already granted.
  Future<bool> hasPermission() async {
    return await Permission.microphone.isGranted;
  }

  // ── Recording ───────────────────────────────────────────────────────────────

  /// Start recording audio.
  /// Returns the file path where audio will be saved.
  /// Throws [AudioPermissionException] if mic permission denied.
  /// Throws [AudioRecordingException] if recording fails to start.
  Future<String> startRecording() async {
    final permitted = await requestPermission();
    if (!permitted) {
      throw AudioPermissionException();
    }

    if (_isRecording) {
      debugPrint('[AudioService] Already recording, stopping first');
      await stopRecording();
    }

    try {
      final dir = await getTemporaryDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final path = '${dir.path}/daily_recording_$timestamp.m4a';

      await _recorder.start(
        const RecordConfig(
          encoder: AudioEncoder.aacLc,
          bitRate: 128000,
          sampleRate: 16000,
          numChannels: 1,
        ),
        path: path,
      );

      _isRecording = true;
      _currentPath = path;

      debugPrint('[AudioService] Recording started: $path');
      return path;
    } catch (e) {
      _isRecording = false;
      _currentPath = null;
      debugPrint('[AudioService] Failed to start recording: $e');
      throw AudioRecordingException('Failed to start recording: $e');
    }
  }

  /// Stop recording and return the saved file.
  /// Returns null if no recording was in progress.
  Future<File?> stopRecording() async {
    if (!_isRecording) {
      debugPrint('[AudioService] Not recording, nothing to stop');
      return null;
    }

    try {
      final path = await _recorder.stop();
      _isRecording = false;

      if (path == null) {
        debugPrint('[AudioService] Recording stopped but no path returned');
        _currentPath = null;
        return null;
      }

      final file = File(path);
      final exists = await file.exists();

      if (!exists) {
        debugPrint('[AudioService] Recording file not found at: $path');
        _currentPath = null;
        return null;
      }

      final size = await file.length();
      debugPrint('[AudioService] Recording saved: $path ($size bytes)');

      _currentPath = null;
      return file;
    } catch (e) {
      _isRecording = false;
      _currentPath = null;
      debugPrint('[AudioService] Failed to stop recording: $e');
      throw AudioRecordingException('Failed to stop recording: $e');
    }
  }

  /// Cancel recording without saving the file.
  Future<void> cancelRecording() async {
    if (!_isRecording) return;

    try {
      await _recorder.cancel();
      _isRecording = false;

      if (_currentPath != null) {
        final file = File(_currentPath!);
        if (await file.exists()) {
          await file.delete();
          debugPrint('[AudioService] Cancelled and deleted: $_currentPath');
        }
      }

      _currentPath = null;
    } catch (e) {
      _isRecording = false;
      _currentPath = null;
      debugPrint('[AudioService] Error cancelling recording: $e');
    }
  }

  /// Ask the recorder directly if it is recording.
  Future<bool> isCurrentlyRecording() async {
    return await _recorder.isRecording();
  }

  // ── Cleanup ─────────────────────────────────────────────────────────────────

  /// Delete a recorded file after it has been uploaded.
  Future<void> deleteFile(String path) async {
    try {
      final file = File(path);
      if (await file.exists()) {
        await file.delete();
        debugPrint('[AudioService] Deleted file: $path');
      }
    } catch (e) {
      debugPrint('[AudioService] Failed to delete file: $e');
    }
  }

  /// Dispose the recorder — call this in your widget's dispose().
  Future<void> dispose() async {
    if (_isRecording) {
      await cancelRecording();
    }
    _recorder.dispose();
  }
}