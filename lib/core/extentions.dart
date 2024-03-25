import 'package:flutter/material.dart';

extension MyTheme on BuildContext {
  ThemeData theme() {
    return Theme.of(this);
  }

  TextTheme textThem() {
    return Theme.of(this).textTheme;
  }
}
