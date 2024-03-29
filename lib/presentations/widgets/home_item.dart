import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medical_reminder/core/extentions.dart';
import 'package:medical_reminder/presentations/cubits/manage_reminder/managereminder_cubit.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ManagereminderCubit, ManagereminderState>(
        builder: (context, state) {
          if (state is GetAllTodayReminderLoader) {
            return Center(
              child: LoadingAnimationWidget.discreteCircle(
                color: Colors.white,
                secondRingColor: context.theme().primaryColor,
                thirdRingColor: context.theme().colorScheme.primary,
                size: 50,
              ),
            );
          }
          if (state is GetAllTodayReminder) {
            if (state.remindersList.isEmpty) {
              return Image.asset('assets/images/empty_reminder.png');
            }
            return ListView.builder(
              itemCount: state.remindersList.length,
              padding: const EdgeInsets.only(
                left: 12,
                right: 12,
                bottom: 36,
              ),
              itemBuilder: (context, index) {
                return ReminderItem(
                  state: state,
                  index: index,
                );
              },
            );
          }
          return Image.asset('assets/images/empty_reminder.png');
        },
      ),
    );
  }
}

class ReminderItem extends StatelessWidget {
  final GetAllTodayReminder state;
  final int index;
  const ReminderItem({super.key, required this.state, required this.index});

  @override
  Widget build(BuildContext context) {
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
  }
}
