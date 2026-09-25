import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_lib_theme/features/theme/data/datasource/preferences/app_theme_preferences_impl.dart';
import 'package:smart_lib_theme/smart_lib_theme.dart';

final _light = AppTheme(key: 'light', themeData: AppDefaultThemesData().light);
final _dark = AppTheme(key: 'dark', themeData: AppDefaultThemesData().dark);

const _prefKey = AppThemePreferencesImpl.prefKeyAppTheme;

Future<void> _init(WidgetTester tester, {Map<String, Object> prefs = const {}}) async {
  SharedPreferences.setMockInitialValues(prefs);
  await tester.runAsync(() => AppThemeManager.init(themes: [_light, _dark]));
}

/// The bloc is created inside `runAsync`, so its events run on the real event loop.
Future<void> _settle(WidgetTester tester) async {
  await tester.runAsync(() => Future<void>.delayed(Duration.zero));
  await tester.pumpAndSettle();
}

class _CounterPage extends StatefulWidget {
  const _CounterPage();

  @override
  State<_CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<_CounterPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('second page $count'),
          TextButton(onPressed: () => setState(() => count++), child: const Text('inc')),
          TextButton(onPressed: () => AppThemeManager.changeTheme(themeKey: 'dark'), child: const Text('dark')),
        ],
      ),
    );
  }
}

Widget _app() {
  return AppThemeBuilder(
    builder: (theme) => MaterialApp(
      theme: theme,
      home: Builder(
        builder: (context) => Scaffold(
          body: TextButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => const _CounterPage())),
            child: const Text('open'),
          ),
        ),
      ),
    ),
  );
}

void main() {
  group('AppThemeManager.init', () {
    testWidgets('rejects an empty theme list', (tester) async {
      expect(() => AppThemeManager.init(themes: []), throwsA(isA<AppThemeException>()));
    });

    testWidgets('rejects duplicate keys', (tester) async {
      expect(
        () => AppThemeManager.init(themes: [_light, AppTheme(key: 'light', themeData: ThemeData())]),
        throwsA(isA<AppThemeException>()),
      );
    });

    testWidgets('restores the saved theme', (tester) async {
      await _init(tester, prefs: {_prefKey: 'dark'});
      expect(AppThemeManager.currentThemeKey, 'dark');
    });

    testWidgets('falls back to the system brightness when nothing is saved', (tester) async {
      tester.platformDispatcher.platformBrightnessTestValue = Brightness.dark;
      addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);
      await _init(tester);
      expect(AppThemeManager.currentThemeKey, 'dark');
    });

    testWidgets('falls back to the first theme when the saved key no longer exists', (tester) async {
      await _init(tester, prefs: {_prefKey: 'removed'});
      expect(AppThemeManager.currentThemeKey, 'light');
    });

    testWidgets('can be called more than once', (tester) async {
      await _init(tester);
      await _init(tester, prefs: {_prefKey: 'dark'});
      expect(AppThemeManager.currentThemeKey, 'dark');
    });
  });

  group('AppThemeManager.changeTheme', () {
    testWidgets('throws for an unknown key', (tester) async {
      await _init(tester);
      expect(() => AppThemeManager.changeTheme(themeKey: 'nope'), throwsA(isA<AppThemeException>()));
    });

    testWidgets('keeps the current page and its state, applies and persists the theme', (tester) async {
      await _init(tester);
      await tester.pumpWidget(_app());

      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('inc'));
      await tester.pump();
      expect(find.text('second page 1'), findsOneWidget);

      await tester.tap(find.text('dark'));
      await _settle(tester);

      expect(find.text('second page 1'), findsOneWidget);
      expect(find.text('open'), findsNothing);
      final context = tester.element(find.text('second page 1'));
      expect(Theme.of(context).brightness, Brightness.dark);
      expect(context.appColors().surface, _dark.themeData.extension<AppThemeExtension>()!.surface);
      expect(AppThemeManager.currentThemeKey, 'dark');

      final prefs = await tester.runAsync(SharedPreferences.getInstance);
      expect(prefs!.getString(_prefKey), 'dark');

      Navigator.of(context).pop();
      await tester.pumpAndSettle();
      expect(Theme.of(tester.element(find.text('open'))).brightness, Brightness.dark);
    });

    testWidgets('still works after AppThemeBuilder is removed and re-inserted', (tester) async {
      await _init(tester);
      await tester.pumpWidget(_app());
      await tester.pumpWidget(const SizedBox());
      await tester.pumpWidget(_app());

      AppThemeManager.changeTheme(themeKey: 'dark');
      await _settle(tester);
      expect(Theme.of(tester.element(find.text('open'))).brightness, Brightness.dark);
    });
  });

  test('AppThemeExtension.lerp interpolates tokens', () {
    final a = DefaultLightThemeExtension();
    final b = DefaultDarkThemeExtension().copyWith(buttonBorderRadius: 16);
    final mid = a.lerp(b, 0.5);
    expect(mid.primary, Color.lerp(a.primary, b.primary, 0.5));
    expect(mid.buttonBorderRadius, 12);
    expect(a.lerp(b, 1).surface, b.surface);
  });
}
