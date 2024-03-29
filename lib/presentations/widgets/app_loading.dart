import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medical_reminder/core/extentions.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
        color: Colors.white,
        secondRingColor: context.theme().primaryColor,
        thirdRingColor: context.theme().colorScheme.primary,
        size: 50,
      ),
    );
  }
}
