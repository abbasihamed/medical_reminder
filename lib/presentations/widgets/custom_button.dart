import 'package:flutter/material.dart';
import 'package:medical_reminder/core/extentions.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const CustomButton({
    super.key,
    this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: context.width(),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: context.theme().primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          title,
          style: context.textThem().labelLarge,
        ),
      ),
    );
  }
}
