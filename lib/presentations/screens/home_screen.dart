import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/core/extentions.dart';
import 'package:medical_reminder/presentations/cubits/manage_reminder/managereminder_cubit.dart';
import 'package:medical_reminder/presentations/widgets/app_bar_title.dart';
import 'package:medical_reminder/presentations/widgets/home_item.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context
        .read<ManagereminderCubit>()
        .getByDate(Jalali.now().toDateTime().toIso8601String());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: const HomeAppBarTitle(),
        leading: Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 70,
              width: 70,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 8),
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
              child: const Icon(Icons.person_add_alt_1),
            ),
          ),
        ),
        leadingWidth: 100,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              height: 50,
              width: context.width(),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '${Jalali.now().formatter.d} ${Jalali.now().formatter.mN}',
                  style: context.textThem().headlineMedium,
                ),
              ),
            ),
          ),
          const HomeItem()
        ],
      ),
    );
  }
}
