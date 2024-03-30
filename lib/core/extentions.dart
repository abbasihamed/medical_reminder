import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

extension MyTheme on BuildContext {
  ThemeData theme() {
    return Theme.of(this);
  }

  TextTheme textThem() {
    return Theme.of(this).textTheme;
  }

  double width() {
    return MediaQuery.sizeOf(this).width;
  }

  double height() {
    return MediaQuery.sizeOf(this).height;
  }

  snackBar(Widget message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: message,
      behavior: SnackBarBehavior.floating,
    ));
  }

  TextDirection txtDirection(String text) {
    if (text.isEmpty) {
      Directionality.of(this) == TextDirection.rtl;
      return TextDirection.rtl;
    } else {
      if (intl.Bidi.detectRtlDirectionality(text)) {
        return TextDirection.rtl;
      } else {
        return TextDirection.ltr;
      }
    }
  }
}

extension Number on String? {
  int toInt() {
    if (this != null && this!.isNotEmpty) {
      return int.parse(this!);
    }
    return 0;
  }

  String dateToStr() {
    final gDate = DateTime.parse(this!);
    final jDate = gDate.toJalali();
    return '${jDate.year}/${jDate.month}/${jDate.day}';
  }

  String dayName() {
    final gDate = DateTime.parse(this!);
    final jDate = gDate.toJalali();
    return jDate.formatter.d;
  }
}
