import 'package:flutter/material.dart';
import 'package:flutter_app/app/utils/constant.dart' as Constants;

class UIText {
  static Text base({
    String text,
    Color color,
    bool isBold = false,
    double letterSpacing = 0,
    double size = 14,
  }) {
    return Text(
      "$text",
      textAlign: TextAlign.left,
      style: TextStyle(
        letterSpacing: letterSpacing,
        fontSize: size,
        color: color ?? Constants.Colors.TEXT_BLACK,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  static Text boldAlignCenter(
      {String text, Color color, double letterSpacing = 1, double size}) {
    return Text(
      "$text",
      textAlign: TextAlign.center,
      style: TextStyle(
        letterSpacing: letterSpacing,
        fontSize: size ?? 14,
        color: color ?? Constants.Colors.TEXT_BLACK,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static Text xxxLargeAlignCenter(
      {String text, Color color, bool isBold, double letterSpacing = 1}) {
    return Text(
      "$text",
      textAlign: TextAlign.center,
      style: TextStyle(
        letterSpacing: letterSpacing,
        fontSize: 50, //28/32/36/
        color: color ?? Constants.Colors.TEXT_BLACK,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  static Text largeAlignCenter(
      {String text, Color color, bool isBold, double letterSpacing = 1}) {
    return Text(
      "$text",
      textAlign: TextAlign.center,
      style: TextStyle(
        letterSpacing: letterSpacing,
        fontSize: 24,
        color: color ?? Constants.Colors.TEXT_BLACK,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  static Text mediumAlignCenter(
      {String text, Color color, bool isBold, double letterSpacing = 1}) {
    return Text(
      "$text",
      textAlign: TextAlign.center,
      style: TextStyle(
        letterSpacing: letterSpacing,
        fontSize: 16,
        color: color ?? Constants.Colors.TEXT_BLACK,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  static Text mediumAlignRight(
      {String text, Color color, bool isBold, double letterSpacing = 1}) {
    return Text(
      "$text",
      textAlign: TextAlign.right,
      style: TextStyle(
        letterSpacing: letterSpacing,
        fontFamily: 'UbuntuMonoRegular',
        fontSize: 16,
        color: color ?? Constants.Colors.TEXT_BLACK,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  static Text mediumAlignLeft(
      {String text, Color color, bool isBold, double letterSpacing = 1}) {
    return Text(
      "$text",
      textAlign: TextAlign.left,
      style: TextStyle(
        letterSpacing: letterSpacing,
        fontSize: 16,
        color: color ?? Constants.Colors.TEXT_BLACK,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
