import 'package:flutter/material.dart';

extension ColorExtension on Color {
  TextStyle ts(double fontSize,{FontWeight? fontWeight, String? fontFamily}) {
      return TextStyle(
        color: this,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
      );
  }
}
