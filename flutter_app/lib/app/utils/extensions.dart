import 'package:flutter/material.dart';

extension WidgetMediaQuery on BuildContext {
  double widthFull() {
    return MediaQuery.of(this).size.width;
  }

  double heightFull() {
    return MediaQuery.of(this).size.height;
  }
}
