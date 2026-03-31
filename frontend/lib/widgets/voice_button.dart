import 'package:flutter/material.dart';

class VoiceButton extends StatelessWidget {
  final bool isRecording;
  final bool isProcessing;
  final VoidCallback? onTap;

  const VoiceButton({
    super.key,
    required this.isRecording,
    required this.isProcessing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isRecording ? Colors.red : Colors.deepPurple;

    return GestureDetector(
      onTap: isProcessing ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 180,
        height: 180,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withValues(alpha: 0.1),
          border: Border.all(color: color, width: 4),
          boxShadow: isRecording
              ? [BoxShadow(color: color.withValues(alpha: 0.4), blurRadius: 20, spreadRadius: 4)]
              : [],
        ),
        child: isProcessing
            ? const Center(child: CircularProgressIndicator())
            : Icon(
                isRecording ? Icons.stop_rounded : Icons.mic,
                size: 72,
                color: color,
              ),
      ),
    );
  }
}