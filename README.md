Here’s a **comprehensive README.md** tailored to your Flutter theme management library, incorporating your GitHub repo, email, and Medium article reference:

---

# 🎨 SmartLib Theme - Effortless Flutter Theme Management
[![Pub Version](https://img.shields.io/pub/v/smart_lib_theme)](https://pub.dev/packages/smart_lib_theme)  
[![GitHub Repo](https://img.shields.io/github/repo-size/Vanik98/smart_lib_theme)](https://github.com/Vanik98/smart_lib_theme)

A **zero-boilerplate**, **BLoC-powered** Flutter theme management library that makes it **ridiculously easy** to create, switch, and customize themes—light, dark, or any style you dream of!

---

## 🌟 Why Use This Library?
- ✅ **One-time setup**: Initialize once, then forget about theme plumbing.
- ✅ **Custom themes made simple**: Create themes with your brand colors in seconds.
- ✅ **Dynamic switching**: Switch themes anywhere in your app with a single line of code.
- ✅ **Persistent themes**: Themes stay saved across app restarts.
- ✅ **Scalable**: Supports dozens of themes without performance issues.

Perfect for apps that need **flexible theming** with **zero complexity** (https://medium.com/@hovhannisyankaro1992/theming-your-flutter-project-as-master-7ea58e5a354c).

---

## 🚀 Quick Start Guide

### 1. Install the Package
Add to `pubspec.yaml`:
```yaml  
dependencies:  
  smart_lib_theme: ^0.1.0  
```  
Then run:
```bash  
flutter pub get  
```  

---

### 2. Initialize the Theme Manager
In your `main.dart`, define your themes and initialize the manager:
```dart  
import 'package:flutter/material.dart';  
import 'package:smart_lib_theme/core/theme/default/themes.dart'; // Default themes  
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

> ✅ **Pro Tip**: Replace `AppDefaultThemesData()` with your **custom theme class** (see below).

---

### 3. Wrap Your App with `AppThemeBuilder`
This ensures the entire UI updates when the theme changes:
```dart  
class MyApp extends StatelessWidget {  
  const MyApp({super.key});  

  @override  
  Widget build(BuildContext context) {  
    return AppThemeBuilder(  
      builder: (theme) {  
        return MaterialApp(  
          title: 'My Themed App',  
          theme: theme, // <-- Dynamic theme applied here  
          home: const HomePage(),  
        );  
      },  
    );  
  }  
}  
```  

> 🧠 Done once, works forever.

---

### 4. Switch Themes Anywhere
From any widget, change themes by **passing the theme key**:
```dart  
GestureDetector(  
  onTap: () {  
    // ✅ New API: Just pass the theme key!  
    AppThemeManager.changeTheme(context: context, themeKey: 'dark');  
  },  
  child: Text('Switch to Dark Mode'),  
);  
```  

> 🔄 The UI updates instantly thanks to BLoC and `ThemeExtension`.  
> ⚠️ **Error Handling**: If the `themeKey` doesn’t exist, `ThemeExceptionConstants.notFoundKey` is thrown. Ensure keys match your initialized themes.

---

### 5. Access Theme Colors & Styles
Use the `BuildContext` extension to apply colors and text styles:
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
              onTap: () {  
                AppThemeManager.changeTheme(context: context, themeKey: 'light');  
              },  
              child: Text('Light Theme'),  
            ),  
          ),  
          const SizedBox(height: 100),  
          Center(  
            child: GestureDetector(  
              onTap: () {  
                AppThemeManager.changeTheme(context: context, themeKey: 'dark');  
              },  
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

## 📄 License
MIT License – see [LICENSE](LICENSE) for details.

---

## 🤝 Contributing
Feel free to open issues or PRs! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## 📬 Feedback
Have questions or suggestions? Reach out on GitHub or email me at [dallakyanvanik@gmail.com](mailto:dallakyanvanik@gmail.com).

---  

Let me know if you'd like this exported as a downloadable `.md` file or want to generate API docs using `dart doc`!