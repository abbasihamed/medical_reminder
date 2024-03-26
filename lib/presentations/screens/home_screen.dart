import 'package:flutter/material.dart';
import 'package:medical_reminder/core/extentions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('کاربر مهمان'),
            Text('امروز حالتان چطوره؟', style: context.textThem().titleMedium),
          ],
        ),
        leading: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.theme().colorScheme.primary,
              boxShadow: [
                BoxShadow(
                  color: context.theme().colorScheme.primary,
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 0),
                )
              ]),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
