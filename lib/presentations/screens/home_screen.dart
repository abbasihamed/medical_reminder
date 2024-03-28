import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/core/extentions.dart';
import 'package:medical_reminder/presentations/cubits/manage_reminder/managereminder_cubit.dart';
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
      body: Column(
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
          Expanded(
            child: BlocBuilder<ManagereminderCubit, ManagereminderState>(
              builder: (context, state) {
                // if (state is ManagereminderCubitFailed) {
                //   return ErrorOutput(message: state.message);
                // }
                if (state is GetAllTodayReminder) {
                  return ListView.builder(
                    itemCount: state.remindersList.length,
                    padding: const EdgeInsets.only(
                      left: 12,
                      right: 12,
                      bottom: 36,
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
                                    state.remindersList[index]?.pillName ?? '',
                                    style: context.textThem().bodyLarge,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    '${state.remindersList[index]?.useMode ?? ''} |  ${state.remindersList[index]?.count ?? ''} عدد',
                                    style: context.textThem().titleMedium,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const VerticalDivider(),
                            Expanded(
                              flex: 1,
                              child: Text(
                                state.remindersList[index]?.time ?? '',
                                style: context.textThem().bodyLarge,
                                textDirection: TextDirection.ltr,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }
                return const SizedBox();
              },
            ),
          )
        ],
      ),
    );
  }
}
