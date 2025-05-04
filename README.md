Here’s an **enhanced, professional version** of your `README.md` with improved formatting, clarity, and structure while retaining all core content:

---

# 🎨 SmartLib Theme - Effortless Flutter Theme Management
[![Pub Version](https://img.shields.io/pub/v/smart_lib_theme)](https://pub.dev/packages/smart_lib_theme)  
[![GitHub Repo](https://img.shields.io/github/repo-size/Vanik98/smart_lib_theme)](https://github.com/Vanik98/smart_lib_theme)  
[![License](https://img.shields.io/github/license/Vanik98/smart_lib_theme)](LICENSE)  
[![Contributions Welcome](https://img.shields.io/badge/contributions-welcome-brightgreen)](CONTRIBUTING.md)

A **zero-boilerplate**, **BLoC-powered** Flutter theme management library that makes it **incredibly simple** to create, switch, and customize themes—light, dark, or any style you dream of!

---

## 🌟 Why Use This Library?
- ✅ **One-time setup**: Initialize once, then forget about theme plumbing.
- ✅ **Custom themes made simple**: Create themes with your brand colors in seconds.
- ✅ **Dynamic switching**: Switch themes anywhere in your app with a single line of code.
- ✅ **Persistent themes**: Themes stay saved across app restarts.
- ✅ **Scalable**: Supports dozens of themes without performance issues.

Perfect for apps that need **flexible theming** with **zero complexity** [[Medium Article](https://medium.com/@hovhannisyankaro1992/theming-your-flutter-project-as-master-7ea58e5a354c)].

---

## 📦 Built With
- [Flutter](https://flutter.dev) (v3.7.2+)
- [BLoC](https://bloclibrary.dev/) for state management
- [SharedPreferences](https://pub.dev/packages/shared_preferences) for persistence
- [ThemeExtension](https://api.flutter.dev/flutter/material/ThemeData/extensions.html) for custom design tokens

---

## 🚀 Quick Start Guide

### 0. TL;DR
**Key Methods**:
1. `await AppThemeManager.init(themes: [])`
2. Wrap `MaterialApp` with `AppThemeBuilder(theme: theme)`
3. `AppThemeManager.changeTheme(context: context, themeKey: 'key')`
4. `AppThemeManager.getCurrentTheme(context: context)` // Always returns the updated theme

---

### 1. Install the Package
Add to `pubspec.yaml`:
```yaml  
dependencies:  
  smart_lib_theme: ^0.1.0  # Replace with latest version
```  
Then run:
```bash  
flutter pub get  
```  

> ⚠️ Ensure `bloc` and `flutter_bloc` are in `dependencies`, not `dev_dependencies`.

---

### 2. Initialize the Theme Manager
In your `main.dart`, define supported themes:
```dart  
import 'package:flutter/material.dart';  
import 'package:smart_lib_theme/core/theme/default/themes.dart';  
import 'package:smart_lib_theme/features/theme/presentation/app_theme_manager.dart';  
import 'package:smart_lib_theme/features/theme/presentation/widgets/app_theme_builder.dart';  

Future<void> main() async {  
  await AppThemeManager.init(themes: [  
    AppTheme(key: 'light', themeData: AppDefaultThemesData().light),  
    AppTheme(key: 'dark', themeData: AppDefaultThemesData().dark),  
  ]);  
  runApp(const MyApp());  
}  
```  

> ✅ Replace `AppDefaultThemesData()` with your **custom theme class** (see below).

---

### 3. Wrap Your App with `AppThemeBuilder`
Ensures dynamic theme updates across the entire UI:
```dart  
class MyApp extends StatelessWidget {  
  const MyApp({super.key});  

  @override  
  Widget build(BuildContext context) {  
    return AppThemeBuilder(  
      builder: (theme) {  
        return MaterialApp(  
          title: 'Themed App',  
          theme: theme, // <-- Dynamic theme applied here  
          home: const HomePage(),  
        );  
      },  
    );  
  }  
}  
```  

> 🧠 **One-time setup**: Done once, works forever.

---

### 4. Switch Themes Dynamically
From any widget, change themes by **passing the theme key**:
```dart  
GestureDetector(  
  onTap: () {  
    AppThemeManager.changeTheme(context: context, themeKey: 'dark');  
  },  
  child: Text('Switch to Dark Mode'),  
)  
```  

> 🔄 The UI updates instantly thanks to BLoC and `ThemeExtension`.  
> ⚠️ If the `themeKey` doesn’t exist, `ThemeExceptionConstants.notFoundKey` is thrown.

---

### 5. Access Theme Colors & Styles
Use `BuildContext` extensions for colors and text styles:
```dart  
Text(  
  'Styled Text',  
  style: context.textTheme().titleLarge?.copyWith(  
    color: context.appColors().onPrimary,  
  ),  
),  
Container(  
  color: context.appColors().surface,  
  child: Text('Surface Background'),  
),  
```  

> 🎨 All tokens (colors, shapes, text styles) are available via `context.appColors()` and `context.textTheme()`.

---

## 🎨 Create Custom Themes

### 1. Define Your Own Colors
Extend `AppThemeExtension` to define your brand palette:
```dart  
class MyCustomThemeExtension extends AppThemeExtension {  
  MyCustomThemeExtension()  
      : super(  
          primary: Colors.purple,  
          onPrimary: Colors.white,  
          secondary: Colors.tealAccent,  
          onSecondary: Colors.black,  
          // Override other tokens as needed  
        );  
}  
```  

### 2. Use Custom Themes in Initialization
Replace defaults with your custom themes:
```dart  
await AppThemeManager.init(themes: [  
  AppTheme(key: 'custom', themeData: ThemeData(  
    extensions: [MyCustomThemeExtension()],  
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),  
  )),  
]);  
```  

> 🎯 Now use `AppThemeManager.changeTheme(context, themeKey: 'custom')` to switch to your theme!

---

## 🧪 Example: Theme Switcher UI
```dart  
class HomePage extends StatelessWidget {  
  const HomePage({super.key});  

  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      backgroundColor: context.appColors().surface,  
      body: Column(  
        children: [  
          const SizedBox(height: 300),  
          Center(  
            child: GestureDetector(  
              onTap: () => AppThemeManager.changeTheme(context: context, themeKey: 'light'),  
              child: Text('Light Theme'),  
            ),  
          ),  
          const SizedBox(height: 100),  
          Center(  
            child: GestureDetector(  
              onTap: () => AppThemeManager.changeTheme(context: context, themeKey: 'dark'),  
              child: Text('Dark Theme', style: context.textTheme().bodyMedium),  
            ),  
          ),  
        ],  
      ),  
    );  
  }  
}  
```  

---

## 📦 Folder Structure (Clean Architecture)
```
lib/  
├── core/                 # Shared utilities (ThemeExtension, default themes)  
│   └── theme/  
│       ├── default/      # Default light/dark themes  
│       ├── extensions/   # ThemeExtension definitions  
│       └── data/         # Component-specific styling (buttons, text, etc.)  
├── features/  
│   └── theme/  
│       ├── domain/       # Entities, use cases  
│       ├── data/         # Repository + SharedPreferences impl  
│       └── presentation/ # BLoC, widgets, manager  
└── di/                   # Dependency injection  
```

## 📄 License
MIT License – see [LICENSE](LICENSE) for details.

---

## 🤝 Contributing
Feel free to open issues or PRs! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## 📬 Feedback
Have questions or suggestions? Reach out on GitHub or email me at [dallakyanvanik@gmail.com](mailto:dallakyanvanik@gmail.com).
--- 

### ✨ Maintained by [Vanik Dallakyan](https://github.com/Vanik98)
*Made with ❤️ for Flutter developers everywhere.*

---