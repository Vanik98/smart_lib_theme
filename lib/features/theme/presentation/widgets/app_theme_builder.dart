// smart_lib_theme/features/theme/presentation/widgets/app_theme_builder.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_lib_theme/di/dependency_injection.dart';

import '../../../../core/utils/exception/constants/exception_constants.dart';
import '../bloc/app_theme_bloc.dart';

/// Signature for a function that builds a widget subtree based on current theme data.
///
/// Used by [AppThemeBuilder] to construct UI elements responsive to theme changes.
typedef ThemeBuilder = Widget Function(ThemeData? theme);

/// A stateful widget that provides access to the application's theme via Bloc.
///
/// This widget ensures that the UI rebuilds whenever the theme changes. It wraps the widget tree
/// with [BlocProvider] and [BlocBuilder] to manage and listen to theme state changes.
class AppThemeBuilder extends StatelessWidget {
  /// The builder function used to create the widget subtree based on current theme.
  final ThemeBuilder builder;

  /// Creates an [AppThemeBuilder].
  ///
  /// Requires a non-null [builder] function that takes a [ThemeData] and returns a [Widget].
  const AppThemeBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    try {
      // Retrieve the AppThemeBloc instance from dependency injection container
      final bloc = themeLocator.get<AppThemeBloc>();

      // Provide the bloc to the widget subtree and wrap it in a _AppThemeBuilder
      return BlocProvider(
        create: (context) => bloc,
        child: _AppThemeBuilder(builder: (ThemeData? theme) => builder(theme)),
      );
    } catch (e) {
      // Throw exception if Bloc could not be retrieved or initialized
      throw Exception(ThemeExceptionConstants.initErrorMessage);
    }
  }
}

/// Private wrapper widget responsible for delegating UI construction to [_ThemeBuilder].
///
/// Ensures the [AppThemeBloc] is accessible in the widget tree before calling the builder.
class _AppThemeBuilder extends StatelessWidget {
  /// The builder function used to create the widget subtree based on current theme.
  final ThemeBuilder builder;

  /// Creates a private wrapper widget with the given [builder].
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

/// Private widget that listens to Bloc events and rebuilds the UI on theme change.
///
/// Uses [BlocBuilder] to listen to [AppThemeBloc] state changes and invokes the builder function
/// with the updated [ThemeData].
class _ThemeBuilder extends StatelessWidget {
  /// The builder function used to create the widget subtree based on current theme.
  final ThemeBuilder builder;

  /// Creates a private theme builder with the given [builder].
  const _ThemeBuilder({required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeBloc, AppThemeState>(
      builder: (context, state) {
        // Rebuild the UI with the new theme data
        return builder(state.theme);
      },
    );
  }
}