import 'package:flutter/material.dart';
import 'package:medical_reminder/core/extentions.dart';

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

class CustomNavItem extends StatelessWidget {
  final IconData icons;
  final VoidCallback onTap;
  final bool selected;
  const CustomNavItem({
    super.key,
    required this.icons,
    required this.onTap,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        icons,
        size: 34,
        color: selected
            ? context.theme().bottomNavigationBarTheme.selectedItemColor
            : context.theme().bottomNavigationBarTheme.unselectedItemColor,
      ),
    );
  }
}
