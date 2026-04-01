import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config/app_config.dart';
import '../services/notification_service.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final _notifService = NotificationService();

  bool _notificationsEnabled = true;
  bool _verbalReminders = true;
  int _dndStart = 22;
  int _dndEnd = 7;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final verbal = await _notifService.isVerbalEnabled();
    final dnd = await _notifService.getDoNotDisturbHours();
    if (mounted) {
      setState(() {
        _verbalReminders = verbal;
        _dndStart = dnd[0];
        _dndEnd = dnd[1];
        _loading = false;
      });
    }
  }

  String _formatHour(int hour) {
    final suffix = hour < 12 ? 'AM' : 'PM';
    final h = hour % 12 == 0 ? 12 : hour % 12;
    return '$h:00 $suffix';
  }

  Future<void> _pickDndHour(bool isStart) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: isStart ? _dndStart : _dndEnd, minute: 0),
      helpText: isStart ? 'DND Start Time' : 'DND End Time',
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _dndStart = picked.hour;
        } else {
          _dndEnd = picked.hour;
        }
      });
      await _notifService.setDoNotDisturbHours(_dndStart, _dndEnd);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading)
      return const Scaffold(body: Center(child: CircularProgressIndicator()));

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          // ── Profile / App Info ─────────────────────────────
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [Colors.deepPurple, Colors.deepPurple],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.white24,
                  child: Icon(Icons.person, size: 36, color: Colors.white),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Daily User',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('Version ${AppConfig.appVersion}',
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 13)),
                    Text(AppConfig.apiBaseUrl,
                        style: const TextStyle(
                            color: Colors.white54, fontSize: 11)),
                  ],
                ),
              ],
            ),
          ),

          // ── Notifications ──────────────────────────────────
          _sectionHeader('Notifications'),
          SwitchListTile(
            secondary: const Icon(Icons.notifications_outlined),
            title: const Text('Enable Notifications'),
            subtitle: const Text('Receive reminders for your tasks'),
            value: _notificationsEnabled,
            onChanged: (val) async {
              setState(() => _notificationsEnabled = val);
              if (val) {
                await _notifService.requestPermissions();
              } else {
                await _notifService.cancelAll();
              }
            },
          ),
          SwitchListTile(
            secondary: const Icon(Icons.record_voice_over_outlined),
            title: const Text('Verbal Reminders'),
            subtitle: const Text('Speak reminders aloud using TTS'),
            value: _verbalReminders,
            onChanged: _notificationsEnabled
                ? (val) async {
                    setState(() => _verbalReminders = val);
                    await _notifService.setVerbalEnabled(val);
                  }
                : null,
          ),

          // ── Do Not Disturb ─────────────────────────────────
          _sectionHeader('Do Not Disturb'),
          ListTile(
            leading: const Icon(Icons.bedtime_outlined),
            title: const Text('Start Time'),
            subtitle: Text(_formatHour(_dndStart)),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _pickDndHour(true),
          ),
          ListTile(
            leading: const Icon(Icons.wb_sunny_outlined),
            title: const Text('End Time'),
            subtitle: Text(_formatHour(_dndEnd)),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _pickDndHour(false),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Text(
              'Notifications and verbal reminders will be silenced from '
              '${_formatHour(_dndStart)} to ${_formatHour(_dndEnd)}',
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ),

          // ── Voice & Audio ──────────────────────────────────
          _sectionHeader('Voice & Audio'),
          ListTile(
            leading: const Icon(Icons.mic_outlined),
            title: const Text('Recording Quality'),
            subtitle: const Text('16kHz mono — optimised for speech'),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.deepPurple.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text('Default',
                  style: TextStyle(fontSize: 12, color: Colors.deepPurple)),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.speed_outlined),
            title: const Text('TTS Speed'),
            subtitle: const Text('How fast reminders are spoken'),
            trailing: const Text('Normal',
                style: TextStyle(color: Colors.grey, fontSize: 13)),
            onTap: () => _showTtsSpeedDialog(),
          ),

          // ── Data ──────────────────────────────────────────
          _sectionHeader('Data'),
          ListTile(
            leading: const Icon(Icons.delete_sweep_outlined),
            title: const Text('Clear Cache'),
            subtitle: const Text('Remove temporary files'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _confirmClearCache(),
          ),

          // ── About ─────────────────────────────────────────
          _sectionHeader('About'),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About Daily'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => showAboutDialog(
              context: context,
              applicationName: AppConfig.appName,
              applicationVersion: AppConfig.appVersion,
              applicationLegalese: '© 2026 Daily',
              children: [
                const SizedBox(height: 12),
                const Text(
                    'An AI-powered, voice-first productivity app designed for people with ADHD.'),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
        child: Text(title,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.deepPurple.shade400,
                letterSpacing: 0.5)),
      );

  void _showTtsSpeedDialog() {
    showDialog(
      context: context,
      builder: (_) => SimpleDialog(
        title: const Text('TTS Speed'),
        children: ['Slow', 'Normal', 'Fast'].map((speed) {
          return SimpleDialogOption(
            onPressed: () => Navigator.pop(context),
            child: Text(speed),
          );
        }).toList(),
      ),
    );
  }

  void _confirmClearCache() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Clear Cache'),
        content: const Text('This will remove all temporary audio files.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Cache cleared!')));
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }
}
