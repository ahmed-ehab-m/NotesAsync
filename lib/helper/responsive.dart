import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveSpacing {
  static double fontSize(double value) => value.sp;
  static double value(double value) => (value.r);
  static double vertical(double value) => value.w;
  static double horizontal(double value) => value.h;
  static EdgeInsets allPadding(double value) => EdgeInsets.all(value.r);
  static EdgeInsets symmetricPadding(
      {double horizontal = 0, double vertical = 0}) {
    return EdgeInsets.symmetric(
      horizontal: horizontal.w,
      vertical: vertical.h,
    );
  }

  static EdgeInsets onlyPadding({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return EdgeInsets.only(
      left: left.w,
      top: top.h,
      right: right.w,
      bottom: bottom.h,
    );
  }
}
