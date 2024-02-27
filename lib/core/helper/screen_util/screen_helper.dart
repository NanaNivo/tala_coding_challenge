import 'package:flutter/material.dart';


class ScreensHelper {
   late double width;
   late double height;

   ScreensHelper(this.width, this.height);

   double fromWidth(double percent) {
    assert( percent >= 0.0 && percent <= 100.0);
    return (percent/100.0) * width;
  }

   fromHeight(double percent) {
    assert(percent >= 0.0 && percent <= 100.0);
    return ((percent/100.0) * height);
  }

  factory ScreensHelper.of(BuildContext context) {
    return ScreensHelper(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
  }

  // static scaleText(double fontSize, {bool allowFontScalingSelf}) {
  //   return ScreenUtil().setSp(fontSize, allowFontScalingSelf: allowFontScalingSelf);
  // }
}
