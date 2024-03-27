import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

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
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: message));
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
