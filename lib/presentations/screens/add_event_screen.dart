import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medical_reminder/core/extentions.dart';
import 'package:medical_reminder/presentations/widgets/custom_button.dart';
import 'package:time_picker_spinner/time_picker_spinner.dart';

class AddEventscreen extends StatelessWidget {
  const AddEventscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
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
              maxLength: 100,
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
            const PillTime(),
            const SizedBox(height: 12),
            Text('نحوه استفاده', style: context.textThem().labelMedium),
            const HowToUse(),
            const SizedBox(height: 50),
            const CustomButton(
              title: 'اضافه کردن',
            )
          ],
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        selected = 0;
                        overlayController.hide();
                        setState(() {});
                      },
                      child: Text(
                        useTime[0],
                        style: theme,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        selected = 1;
                        overlayController.hide();
                        setState(() {});
                      },
                      child: Text(
                        useTime[1],
                        style: theme,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        selected = 2;
                        overlayController.hide();
                        setState(() {});
                      },
                      child: Text(
                        useTime[2],
                        style: theme,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        selected = 3;
                        overlayController.hide();
                        setState(() {});
                      },
                      child: Text(
                        useTime[3],
                        style: theme,
                      ),
                    ),
                  ],
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
          onTap: () {
            showModalBottomSheet(
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
