import 'package:flutter/cupertino.dart';
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
        secondary: Color(0XFF8D2DFF),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFE6E6E6),
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 22,
          color: Color(0XFF3E3E3E),
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0XFFD7D7D7),
        selectedItemColor: Color(0XFFAB7CEE),
        unselectedItemColor: Color(0XFF989898),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Color(0XFFF0F0F0),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0XFF8B2FFE),
        iconSize: 36,
        shape: CircleBorder(),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0XFFE6E6E6),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
      chipTheme: const ChipThemeData(
        backgroundColor: Colors.transparent,
        side: BorderSide.none,
        color: MaterialStatePropertyAll( Color(0XFFE6E6E6)),
        disabledColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        bodyLarge: TextStyle(
          fontSize: 22,
          color: Color(0XFF313536),
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
        labelLarge: TextStyle(
          fontSize: 22,
          color: Color(0XFFF7F5FF),
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
        labelMedium: TextStyle(
          fontSize: 22,
          color: Color(0XFF535353),
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
        titleLarge: TextStyle(
          fontSize: 22,
          color: Color(0XFF8D2DFF),
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          color: Color(0XFF939393),
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }
}
