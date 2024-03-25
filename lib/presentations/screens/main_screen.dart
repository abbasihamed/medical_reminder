import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/presentations/cubits/bottomnav/bottomnav_cubit.dart';
import 'package:medical_reminder/presentations/screens/home_scrren.dart';
import 'package:medical_reminder/presentations/widgets/custom_bottom_navigation.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customNav = context.read<BottomnavCubit>();
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocBuilder<BottomnavCubit, BottomnavState>(
          builder: (context, state) {
            if (state is BottomnavInitial) {
              return state.scrren;
            }
            return const HomeScreen();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          customNav.go('addEvent');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BlocBuilder<BottomnavCubit, BottomnavState>(
        builder: (context, state) {
          return CustomNavBar(
            items: [
              CustomNavItem(
                icons: Icons.home_outlined,
                selected: state.screenName == 'home',
                onTap: () {
                  customNav.go('home');
                },
              ),
              CustomNavItem(
                icons: Icons.date_range_outlined,
                selected: state.screenName == 'events',
                onTap: () {
                  customNav.go('events');
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
