// smart_lib_theme/features/theme/presentation/widgets/app_theme_builder.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/exception/app_theme_exception.dart';
import '../../../../di/dependency_injection.dart';
import '../bloc/app_theme_bloc.dart';

/// Signature for a function that builds a widget subtree from the current theme data.
typedef ThemeBuilder = Widget Function(ThemeData theme);

/// Rebuilds [builder] with the new [ThemeData] whenever the app theme changes.
///
/// Wrap your `MaterialApp` with it and pass the theme through. Because only the
/// `theme` argument changes, Flutter keeps the existing `MaterialApp` and its
/// `Navigator`, so the user stays on the same page while the new theme is applied
/// everywhere.
///
/// Create routers (e.g. `GoRouter`) outside [builder]; a router created inside it is
/// recreated on every theme change and would reset navigation.
class AppThemeBuilder extends StatelessWidget {
  final ThemeBuilder builder;

  const AppThemeBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    if (!themeLocator.isRegistered<AppThemeBloc>()) {
      throw const AppThemeException(ThemeExceptionConstants.initErrorMessage);
    }
    // `.value` so the provider never closes the app-wide bloc when this widget is disposed.
    return BlocProvider<AppThemeBloc>.value(
      value: themeLocator<AppThemeBloc>(),
      child: BlocBuilder<AppThemeBloc, AppThemeState>(
        builder: (context, state) => builder(state.themeData),
      ),
    );
  }
}
