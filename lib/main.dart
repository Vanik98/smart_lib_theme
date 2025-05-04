import 'package:flutter/material.dart';
import 'package:smart_lib_theme/core/theme/theme_ext.dart';
import 'package:smart_lib_theme/features/theme/domain/entity/app_theme.dart';

import 'core/theme/themes.dart';
import 'features/theme/presentation/app_theme_manager.dart';
import 'features/theme/presentation/widgets/app_theme_builder.dart';

Future<void> main() async {
  await AppThemeManager.init(themes: [
    AppTheme(key: 'light', themeData: AppThemesData().light),
    AppTheme(key: 'dark', themeData: AppThemesData().dark)
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo',  home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.themeExt.primary,
      body: Column(
        children: [
          SizedBox(height: 300),
          Center(
            child: GestureDetector(
              onTap: () {
                AppThemeManager.changeTheme(context: context, theme: AppTheme(key: 'light', themeData: ThemeData()));
              },
              child: Text('light'),
            ),
          ),
          SizedBox(height: 100),
          Center(
            child: GestureDetector(
              onTap: () {
                AppThemeManager.changeTheme(context: context, theme: AppTheme(key: 'dark', themeData: ThemeData()));
              },
              child: Text('dark'),
            ),
          ),
        ],
      ),
    );
  }
}
