import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:record/record.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import '../providers/api_provider.dart';
import '../providers/task_provider.dart';
import '../models/intent.dart';

class VoiceInputScreen extends ConsumerStatefulWidget {
  const VoiceInputScreen({super.key});

  @override
  ConsumerState<VoiceInputScreen> createState() => _VoiceInputScreenState();
}

class _VoiceInputScreenState extends ConsumerState<VoiceInputScreen> {
  final AudioRecorder _audioRecorder = AudioRecorder();
  bool _isRecording = false;
  bool _isProcessing = false;
  String? _audioPath;
  String _transcription = '';
  IntentExtractionResponse? _intentResponse;

  @override
  void dispose() {
    _audioRecorder.dispose();
    super.dispose();
  }

  Future<void> _toggleRecording() async {
    if (_isRecording) {
      await _stopRecording();
    } else {
      await _startRecording();
    }
  }

  Future<void> _startRecording() async {
    final status = await Permission.microphone.request();
    if (!status.isGranted) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Microphone permission denied')),
        );
      }
      return;
    }

    final path = '${Directory.systemTemp.path}/recording_${DateTime.now().millisecondsSinceEpoch}.m4a';
    
    await _audioRecorder.start(
      const RecordConfig(
        encoder: AudioEncoder.aacLc,
        bitRate: 128000,
        sampleRate: 44100,
      ),
      path: path,
    );

    setState(() {
      _isRecording = true;
      _audioPath = path;
      _transcription = '';
      _intentResponse = null;
    });
  }

  Future<void> _stopRecording() async {
    await _audioRecorder.stop();
    
    setState(() {
      _isRecording = false;
      _isProcessing = true;
    });

    await _processAudio();
  }

  Future<void> _processAudio() async {
    if (_audioPath == null) return;

    try {
      final apiService = ref.read(apiServiceProvider);
      
      final transcriptionResponse = await apiService.transcribeAudio(File(_audioPath!));
      
      setState(() {
        _transcription = transcriptionResponse.transcription;
      });

      final intentResponse = await apiService.extractIntent(_transcription);
      
      setState(() {
        _intentResponse = intentResponse;
      });

      if (mounted) {
        _showConfirmationDialog();
      }

    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }
  }

  void _showConfirmationDialog() {
    if (_intentResponse == null || _intentResponse!.intents.isEmpty) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Tasks'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _intentResponse!.intents.map((intent) {
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Type: ${intent.type.name}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text('Content: ${intent.content}'),
                      const SizedBox(height: 4),
                      Text('Time: ${intent.datetime}'),
                      Text('Duration: ${intent.durationMinutes} min'),
                      Text('Priority: ${intent.priority.name}'),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              await _createTasks();
            },
            child: const Text('Create All'),
          ),
        ],
      ),
    );
  }

  Future<void> _createTasks() async {
    if (_intentResponse == null) return;

    try {
      final tasksNotifier = ref.read(tasksNotifierProvider.notifier);
      
      for (final intent in _intentResponse!.intents) {
        await tasksNotifier.createTask(
          content: intent.content,
          type: intent.type,
          datetime: intent.datetime,
          priority: intent.priority,
          flexible: intent.flexible,
          durationMinutes: intent.durationMinutes,
        );
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tasks created successfully!')),
        );
        
        setState(() {
          _transcription = '';
          _intentResponse = null;
          _audioPath = null;
        });
        
        Navigator.pop(context);
      }

    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create tasks: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice Input'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _isProcessing ? null : _toggleRecording,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _isRecording 
                        ? Colors.red.withOpacity(0.2)
                        : Colors.deepPurple.withOpacity(0.2),
                    border: Border.all(
                      color: _isRecording ? Colors.red : Colors.deepPurple,
                      width: 4,
                    ),
                  ),
                  child: Icon(
                    _isRecording ? Icons.stop : Icons.mic,
                    size: 80,
                    color: _isRecording ? Colors.red : Colors.deepPurple,
                  ),
                ),
              ),
              
              const SizedBox(height: 32),
              
              Text(
                _isRecording 
                    ? 'Recording...' 
                    : _isProcessing 
                        ? 'Processing...' 
                        : 'Tap to record',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              
              const SizedBox(height: 48),
              
              if (_transcription.isNotEmpty) ...[
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Transcription:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(_transcription),
                      ],
                    ),
                  ),
                ),
              ],
              
              if (_isProcessing)
                const Padding(
                  padding: EdgeInsets.only(top: 24.0),
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}