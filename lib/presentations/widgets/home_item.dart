import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/core/extentions.dart';
import 'package:medical_reminder/presentations/cubits/manage_reminder/managereminder_cubit.dart';
import 'package:medical_reminder/presentations/widgets/app_loading.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ManagereminderCubit, ManagereminderState>(
        builder: (context, state) {
          if (state is GetAllTodayReminderLoader) {
            return const AppLoading();
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
                return DeleteItem(
                  id: state.remindersList[index]!.id!,
                  child: ReminderItem(
                    state: state,
                    index: index,
                  ),
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

class DeleteItem extends StatelessWidget {
  final int id;
  final Widget child;
  const DeleteItem({super.key, required this.id, required this.child});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(id.toString()),
      onDismissed: (direction) {
        context.read<ManagereminderCubit>().deleteById(id);
      },
      dragStartBehavior: DragStartBehavior.start,
      direction: DismissDirection.startToEnd,
      background: Container(
        height: 100,
        width: context.width(),
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(12),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(
          Icons.delete,
          size: 34,
          color: context.theme().colorScheme.primary,
        ),
      ),
      child: child,
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
