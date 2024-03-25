import 'package:flutter/material.dart';
import 'package:medical_reminder/config/app_theme.dart';
import 'package:medical_reminder/presentations/screens/main_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppTheme.theme,
      title: "دستاری پزشکی",
      home: const MainScreen(),
    );
  }
}
