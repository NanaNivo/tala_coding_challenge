import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_coding_challenge/app+injection/di.dart';
import 'package:tala_coding_challenge/core/resources/colors.dart';
import 'package:tala_coding_challenge/core/resources/constants.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPress;
  final String text;
  final double? width;
  final double? hight;
  final Color? color;
  final Color? textColor;
  final bool? withShadow;
  final TextStyle? textStyle;

  const PrimaryButton({
    Key? key,
    required this.onPress,
    required this.text,
    this.width,
    this.hight,
    this.color,
    this.textColor,
    this.withShadow = true,this.textStyle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: width ?? 650.sp,
        height: hight ?? 150.sp,
        decoration: BoxDecoration(
            color: color ?? locator<AppThemeColors>().primaryColor,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              if (withShadow!=null&&withShadow!)
                const BoxShadow(
                    blurRadius: 2,
                    offset: Offset(1, 1),
                    spreadRadius: 1,
                    color: Colors.black45),
            ]
            // border: Border.all(
            //   color: Theme.of(context).primaryColor,
            // ),
            ),
        child: Center(
          child: Text(
            text,
            style:textStyle??AppTheme.appTextTheme(textColor??locator<AppThemeColors>().dark).titleMedium
          ),
        ),
      ),
    );
  }
}