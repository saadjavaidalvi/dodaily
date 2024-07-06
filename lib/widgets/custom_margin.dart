import 'package:flutter/material.dart';
import 'package:responsive_kit/responsive_kit.dart';

abstract class Cmargin implements EdgeInsetsGeometry {
  /// An [EdgeInsets] with zero offsets in each direction.
  static final EdgeInsetsGeometry zero = Cmargin.only();

  static EdgeInsetsGeometry only({
    double left = 0,
    double right = 0,
    double top = 0,
    double bottom = 0,
  }) {
    return EdgeInsets.only(
      left: SizeConfig.getMyDynamicWidth(left),
      right: SizeConfig.getMyDynamicWidth(right),
      bottom: SizeConfig.getMyDynamicHeight(bottom),
      top: SizeConfig.getMyDynamicHeight(top),
    );
  }

  static EdgeInsetsGeometry all(
    double margin,
  ) {
    return EdgeInsets.only(
      left: SizeConfig.getMyDynamicWidth(margin),
      right: SizeConfig.getMyDynamicWidth(margin),
      bottom: SizeConfig.getMyDynamicHeight(margin),
      top: SizeConfig.getMyDynamicHeight(margin),
    );
  }

  static EdgeInsetsGeometry symmetric({
    double horizontal = 0,
    double vertical = 0,
  }) {
    return EdgeInsets.symmetric(
      horizontal: horizontal,
      vertical: vertical,
    );
  }
}
