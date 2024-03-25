import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/config/app_theme.dart';
import 'package:medical_reminder/presentations/cubits/bottomnav/bottomnav_cubit.dart';
import 'package:medical_reminder/presentations/screens/main_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomnavCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: AppTheme.theme,
        title: "دستاری پزشکی",
        home: const MainScreen(),
      ),
    );
  }
}
