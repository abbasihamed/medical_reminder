import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/core/extentions.dart';
import 'package:medical_reminder/presentations/cubits/add_event/add_event_cubit.dart';
import 'package:medical_reminder/presentations/widgets/custom_button.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:time_picker_spinner/time_picker_spinner.dart';

class AddEventscreen extends StatelessWidget {
  const AddEventscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocListener<AddEventCubit, AddEventState>(
        listenWhen: (previous, current) => true,
        listener: (context, state) {
          if (state is Validations) {
            if (state.isValid) {
              context.snackBar(const Text('ایتم اضافه شد.'));
              Navigator.pop(context);
            } else {
              context
                  .snackBar(const Text('مطمئن شوید تمام مقادیر وارد شده اند.'));
            }
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('اضافه کردن رویداد'),
          ),
          body: Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/images/medical.png',
              height: 200,
            ),
          ),
          bottomSheet: const AddEventBody(),
        ),
      ),
    );
  }
}

class AddEventBody extends StatefulWidget {
  const AddEventBody({super.key});

  @override
  State<AddEventBody> createState() => _AddEventBodyState();
}

class _AddEventBodyState extends State<AddEventBody> {
  final pillNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.width() * 1.3,
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.theme().bottomSheetTheme.backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
          top: 12,
          bottom: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text('نام دارو', style: context.textThem().labelMedium),
            TextFormField(
              maxLength: 60,
              minLines: 1,
              maxLines: 1,
              controller: pillNameController,
              keyboardType: TextInputType.text,
              textDirection: context.txtDirection(pillNameController.text),
              onChanged: (value) => setState(() {}),
              decoration: const InputDecoration(
                hintText: 'نام دارو را وارد نمایید',
                counterText: '',
              ),
            ),
            const SizedBox(height: 12),
            Text('روز مصرف', style: context.textThem().labelMedium),
            const UseDate(),
            const SizedBox(height: 12),
            const PillTime(),
            const SizedBox(height: 12),
            Text('نحوه استفاده', style: context.textThem().labelMedium),
            const HowToUse(),
            const SizedBox(height: 50),
            CustomButton(
              title: 'اضافه کردن',
              onTap: () {
                context
                    .read<AddEventCubit>()
                    .setEventData(pillName: pillNameController.text);
                context.read<AddEventCubit>().saveData();
              },
            )
          ],
        ),
      ),
    );
  }
}

class UseDate extends StatefulWidget {
  const UseDate({super.key});

  @override
  State<UseDate> createState() => _UseDateState();
}

class _UseDateState extends State<UseDate> {
  String date = 'تاریخ مورد نظر';
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Jalali? picked = await showPersianDatePicker(
          context: context,
          initialDate: Jalali.now(),
          firstDate: Jalali.now(),
          lastDate: Jalali(1450, 9),
        );
        if (picked != null) {
          date =
              '${picked.year.toString()}/${picked.month.toString()}/${picked.day.toString()}';
          context.read<AddEventCubit>().setDateTime(date: picked);
        }
        setState(() {});
      },
      child: Container(
        height: 60,
        width: context.width(),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0XFFE6E6E6),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          date,
          style: context.textThem().headlineMedium,
        ),
      ),
    );
  }
}

class HowToUse extends StatefulWidget {
  const HowToUse({super.key});

  @override
  State<HowToUse> createState() => _HowToUseState();
}

class _HowToUseState extends State<HowToUse> {
  final overlayController = OverlayPortalController();
  final overlayLink = LayerLink();
  final List useTime = [
    'فرقی ندارد',
    'قبل از غذا',
    'بعد از غذا',
    'همراه از غذا',
  ];
  int selected = 0;

  @override
  void initState() {
    super.initState();
    context.read<AddEventCubit>().setEventData(useMode: useTime[0]);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.textThem().headlineMedium;
    return InkWell(
      onTap: () {
        overlayController.toggle();
      },
      child: OverlayPortal(
        controller: overlayController,
        overlayChildBuilder: (BuildContext context) {
          return Positioned(
            top: 0,
            child: CompositedTransformFollower(
              link: overlayLink,
              offset: const Offset(0, 65),
              child: Container(
                height: 200,
                width: context.width() - 24,
                decoration: BoxDecoration(
                  color: const Color(0XFFE6E6E6),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListView.builder(
                  itemCount: useTime.length,
                  itemBuilder: (context, index) {
                    return TextButton(
                      onPressed: () {
                        selected = index;
                        overlayController.hide();
                        context
                            .read<AddEventCubit>()
                            .setEventData(useMode: useTime[index]);
                        setState(() {});
                      },
                      child: Text(
                        useTime[index],
                        style: theme,
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
        child: CompositedTransformTarget(
          link: overlayLink,
          child: Container(
            height: 60,
            width: context.width(),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0XFFE6E6E6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              useTime[selected],
              style: theme,
            ),
          ),
        ),
      ),
    );
  }
}

class PillTime extends StatefulWidget {
  const PillTime({super.key});

  @override
  State<PillTime> createState() => _PillTimeState();
}

class _PillTimeState extends State<PillTime> {
  final hourController = TextEditingController(text: '00');
  final minutesController = TextEditingController(text: '00');
  final clockFormat = [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(2),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('زمان مصرف', style: context.textThem().labelMedium),
        GestureDetector(
          onTap: () async {
            await showModalBottomSheet(
              context: context,
              constraints: const BoxConstraints(maxHeight: 250),
              builder: (context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TimePickerSpinner(
                      locale: const Locale('ar', ''),
                      is24HourMode: true,
                      isShowSeconds: false,
                      isForce2Digits: true,
                      itemHeight: 50,
                      normalTextStyle: const TextStyle(
                        fontSize: 24,
                      ),
                      highlightedTextStyle: const TextStyle(
                        fontSize: 24,
                        color: Colors.blue,
                      ),
                      onTimeChange: (time) {
                        setState(() {});
                        minutesController.text = time.minute.toString();
                        hourController.text = time.hour.toString();
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: CustomButton(
                        title: 'انتخاب',
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                );
              },
            );
            context.read<AddEventCubit>().setDateTime(
                time: '${hourController.text} : ${minutesController.text}');
          },
          child: Container(
            height: 60,
            width: context.width(),
            decoration: BoxDecoration(
              color: const Color(0XFFE6E6E6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: minutesController,
                    textAlign: TextAlign.center,
                    inputFormatters: clockFormat,
                    readOnly: true,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const Text(':'),
                Expanded(
                  child: TextFormField(
                    controller: hourController,
                    textAlign: TextAlign.center,
                    inputFormatters: clockFormat,
                    readOnly: true,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
