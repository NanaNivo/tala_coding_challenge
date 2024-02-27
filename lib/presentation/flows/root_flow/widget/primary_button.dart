import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_coding_challenge/app+injection/di.dart';
import 'package:tala_coding_challenge/core/resources/colors.dart';
import 'package:tala_coding_challenge/core/resources/constants.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPress;
  final String text;
  final double? width;
  final double? hight;
  final Color? color;
  final Color? textColor;
  final bool withShadow;

  const   PrimaryButton({
    Key? key,
    this.onPress,
    required this.text,
    this.width,
    this.hight,
    this.color,
    this.textColor,
    this.withShadow = true,
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
            borderRadius: BorderRadius.circular(90.r),
            boxShadow: [
              if (withShadow)
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
            text??'',
            textAlign:TextAlign.center ,
            style:AppTheme.appTextTheme(textColor??locator<AppThemeColors>().white).titleMedium,
          ),
        ),
      ),
    );
  }
}