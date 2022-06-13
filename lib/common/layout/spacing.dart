import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Spacing {
  Spacing._();

  /// Spacing on vertical direction
  static vs(double spacing) => Padding(padding: EdgeInsets.only(top: spacing));

  /// Spacing on horizontal direction
  static hs(double spacing) => Padding(padding: EdgeInsets.only(left: spacing));

}