import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'package:medical_reminder/core/extentions.dart';
import 'package:medical_reminder/presentations/cubits/manage_reminder/managereminder_cubit.dart';
import 'package:medical_reminder/presentations/widgets/home_item.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'تقویم',
          style: context.textThem().titleLarge?.copyWith(fontSize: 32),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 170,
            width: context.width(),
            child: EventCalendar(
              calendarType: CalendarType.JALALI,
              calendarLanguage: 'fa',
              headerOptions: HeaderOptions(
                monthStringType: MonthStringTypes.FULL,
                weekDayStringType: WeekDayStringTypes.FULL,
              ),
              calendarOptions: CalendarOptions(
                toggleViewType: false,
                viewType: ViewType.DAILY,
                font: 'Yekan',
              ),
              dayOptions: DayOptions(
                disableDaysBeforeNow: true,
                selectedBackgroundColor: context.theme().primaryColor,
                eventCounterColor: context.theme().colorScheme.primary,
                eventCounterTextColor: Colors.black,
              ),
              onChangeDateTime: (d) {
                context.read<ManagereminderCubit>().getByDate(
                    Jalali(d.year, d.month, d.day)
                        .toDateTime()
                        .toIso8601String());
              },
              events: const [],
            ),
          ),
          const HomeItem()
        ],
      ),
    );
  }

  Jalali converToInt(String date) {
    return DateTime.parse(date).toJalali();
  }
}
