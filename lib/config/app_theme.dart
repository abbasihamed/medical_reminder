import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: const Color(0XFF8B2FFE),
      scaffoldBackgroundColor: const Color(0xFFE6E6E6),
      fontFamily: 'Yekan',
      brightness: Brightness.light,
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: const ColorScheme.light(
        primary: Color(0XFFE1CEEC),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0XFFD7D7D7),
        selectedItemColor: Color(0XFFAB7CEE),
        unselectedItemColor: Color(0XFF989898),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0XFF8B2FFE),
        iconSize: 36,
        shape: CircleBorder(),
      ),
    );
  }
}
