import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_lib_theme/di/dependency_injection.dart';

import '../../../../core/utils/exception/constants/exception_constants.dart';
import '../bloc/app_theme_bloc.dart';

typedef ThemeBuilder = Widget Function(ThemeData? theme);

class AppThemeBuilder extends StatelessWidget {
  final ThemeBuilder builder;

  const AppThemeBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    try {
      final bloc = themeLocator.get<AppThemeBloc>();
      return BlocProvider(create: (context) => bloc, child: _AppThemeBuilder(builder: (ThemeData? theme) => builder(theme)));
    } catch (e) {
      throw Exception(ThemeExceptionConstants.initErrorMessage);
    }
  }
}

class _AppThemeBuilder extends StatelessWidget {
  final ThemeBuilder builder;

  const _AppThemeBuilder({required this.builder});

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
