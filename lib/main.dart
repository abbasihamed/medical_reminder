import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/config/app_theme.dart';
import 'package:medical_reminder/locator.dart';
import 'package:medical_reminder/presentations/cubits/add_event/add_event_cubit.dart';
import 'package:medical_reminder/presentations/cubits/bottomnav/bottomnav_cubit.dart';
import 'package:medical_reminder/presentations/cubits/manage_reminder/managereminder_cubit.dart';
import 'package:medical_reminder/presentations/screens/main_screen.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
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
        BlocProvider(
          create: (context) => AddEventCubit(),
        ),
        BlocProvider(
          create: (context) => ManagereminderCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: AppTheme.theme,
        title: "دستیاری پزشکی",
        locale: const Locale('fa'),
        home: const MainScreen(),
      ),
    );
  }
}
