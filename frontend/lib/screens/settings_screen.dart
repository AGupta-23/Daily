import 'package:flutter/material.dart';
import '../config/app_config.dart';

/// Settings screen - app configuration and preferences
/// Full implementation in later phases
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          // App info section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daily',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Version ${AppConfig.appVersion}',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          const Divider(),

          // API Configuration (for development)
          ListTile(
            leading: const Icon(Icons.cloud),
            title: const Text('API Configuration'),
            subtitle: const Text(AppConfig.apiBaseUrl),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Navigate to API configuration screen
            },
          ),

          // Placeholder settings
          const ListTile(
            leading: Icon(Icons.notifications_outlined),
            title: Text('Notifications'),
            subtitle: Text('Coming soon'),
            trailing: Icon(Icons.chevron_right),
            enabled: false,
          ),
          const ListTile(
            leading: Icon(Icons.dark_mode_outlined),
            title: Text('Dark Mode'),
            subtitle: Text('Coming in Phase 7'),
            trailing: Switch(
              value: false,
              onChanged: null,
            ),
          ),
          const ListTile(
            leading: Icon(Icons.mic),
            title: Text('Audio Settings'),
            subtitle: Text('Coming soon'),
            trailing: Icon(Icons.chevron_right),
            enabled: false,
          ),
          
          const Divider(),

          // About section
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: AppConfig.appName,
                applicationVersion: AppConfig.appVersion,
                applicationLegalese: '© 2026 Daily. All rights reserved.',
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'An AI-powered, voice-first productivity app for people with ADHD.',
                  ),
                ],
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('Privacy Policy'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Navigate to privacy policy
            },
          ),
        ],
      ),
    );
  }
}