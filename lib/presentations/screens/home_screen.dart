import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medical_reminder/core/extentions.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('کاربر مهمان'),
            Text('امروز حالتان چطوره؟', style: context.textThem().titleMedium),
          ],
        ),
        leading: Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: 70,
            width: 70,
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
        leadingWidth: 100,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  '${Jalali.now().formatter.d} ${Jalali.now().formatter.mN}',
                  style: context.textThem().headlineMedium,
                ),
              ),
            ),
            SizedBox(
              height: context.height() * 0.75,
              width: context.width(),
              child: ListView.builder(
                itemCount: 20,
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  bottom: 100,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: context.width(),
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE1CEEC),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'نام قرص',
                                style: context.textThem().bodyLarge,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'بعد از غذا |  یک عدد',
                                style: context.textThem().titleMedium,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const VerticalDivider(),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Text('9 اردیبهشت',
                                  style: context.textThem().bodyLarge),
                              Text('12:00',
                                  style: context.textThem().titleMedium),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
