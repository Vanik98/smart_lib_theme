import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_lib_theme/di/dependency_injection.dart';

import '../bloc/app_theme_bloc.dart';

typedef ThemeBuilder = Widget Function(ThemeData? theme);

class AppThemeBuilder extends StatelessWidget {
  final ThemeBuilder builder;

  const AppThemeBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => themeLocator.get<AppThemeBloc>(),
      child: _AppThemeBuilder(
        builder: (ThemeData? theme) {
          return builder(theme);
        },
      ),
    );
  }
}

class _AppThemeBuilder extends StatelessWidget {
  final ThemeBuilder builder;

  const _AppThemeBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return _ThemeBuilder(
      builder: (ThemeData? theme) {
        return builder(theme);
      },
    );
  }
}

class _ThemeBuilder extends StatelessWidget {
  final ThemeBuilder builder;

  const _ThemeBuilder({required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeBloc, AppThemeState>(
      builder: (context, state) {
        return builder(state.theme);
      },
    );
  }
}
