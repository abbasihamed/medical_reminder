import 'package:flutter/material.dart';
import 'package:medical_reminder/core/extentions.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
        children: [],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavBar(
        items: [
          CustomNavItem(
            icons: Icons.home_outlined,
            onTap: () {},
          ),
          CustomNavItem(
            icons: Icons.date_range_outlined,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class CustomNavItem extends StatelessWidget {
  final IconData icons;
  final VoidCallback onTap;
  const CustomNavItem({
    super.key,
    required this.icons,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        icons,
        size: 34,
      ),
    );
  }
}

class CustomNavBar extends StatelessWidget {
  final List<CustomNavItem> items;
  const CustomNavBar({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      margin: const EdgeInsets.only(bottom: 30, left: 12, right: 12),
      decoration: BoxDecoration(
        color: context.theme().bottomNavigationBarTheme.backgroundColor,
        borderRadius: BorderRadius.circular(36),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }
}
