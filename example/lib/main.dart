// smart_lib_theme_example
import 'package:flutter/material.dart';
import 'package:smart_lib_theme/smart_lib_theme.dart';

Future<void> main() async {
  await AppThemeManager.init(themes: [
    AppTheme(key: 'light', themeData: AppDefaultThemesData().light),
    AppTheme(key: 'dark', themeData: AppDefaultThemesData().dark),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (theme) => MaterialApp(
        title: 'smart_lib_theme demo',
        theme: theme,
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors().surface,
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (_) => const SettingsPage()),
          ),
          child: const Text('Open settings'),
        ),
      ),
    );
  }
}

/// Switching the theme here keeps this page open and its state (the counter) intact.
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    final currentKey = AppThemeManager.currentThemeKey;

    return Scaffold(
      backgroundColor: context.appColors().surface,
      appBar: AppBar(title: const Text('Settings')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _counter++),
        child: const Icon(Icons.add),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Counter: $_counter', style: context.textTheme().titleLarge),
          const SizedBox(height: 16),
          for (final theme in AppThemeManager.appThemes)
            ListTile(
              title: Text(theme.key, style: context.textTheme().bodyMedium),
              trailing: theme.key == currentKey ? Icon(Icons.check, color: context.appColors().primary) : null,
              onTap: () => AppThemeManager.changeTheme(themeKey: theme.key),
            ),
        ],
      ),
    );
  }
}
