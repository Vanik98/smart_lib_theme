// smart_lib_theme_example
import 'package:flutter/material.dart';
import 'package:smart_lib_theme/smart_lib_theme.dart';

/// Main entry point for the application
Future<void> main() async {
  // Initialize theme manager with supported themes
  await AppThemeManager.init(themes: [
    AppTheme(key: 'light', themeData: AppDefaultThemesData().light),
    AppTheme(key: 'dark', themeData: AppDefaultThemesData().dark)
  ]);
  runApp(const MyApp());
}

/// Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
        builder: (theme) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: theme,
            home: HomePage(),
          );
        }
    );
  }
}

/// Home screen demonstrating theme switching
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors().surface,
      body: Column(
        children: [
          SizedBox(height: 300),
          Center(
            child: GestureDetector(
              onTap: () {
                // Switch to light theme
                AppThemeManager.changeTheme(
                    context: context,
                    themeKey:  'light'
                );
              },
              child: Text('light'),
            ),
          ),
          SizedBox(height: 100),
          Center(
            child: GestureDetector(
              onTap: () {
                // Switch to dark theme
                AppThemeManager.changeTheme(
                    context: context,
                    themeKey: "dark"
                );
              },
              child: Text('dark', style: context.textTheme().bodyMedium),
            ),
          ),
        ],
      ),
    );
  }
}