import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tala_coding_challenge/core/helper/screen_util/screen_helper.dart';

import '../../../../../app+injection/di.dart';
import '../../../../../core/resources/colors.dart';
import '../../../../../core/resources/constants.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key,  this.onChanged, this.hint,required this.onEditingComplete,required this.controller,required this.onClearPressed});

  final String? hint;
  final Function(String text)? onChanged;
  final Function() onEditingComplete;
  final TextEditingController controller;
  final  Function()? onClearPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.sp,
      width: ScreensHelper.of(context).fromWidth(82),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
          color: locator<AppThemeColors>().dark.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 2,
        )
      ]),
      child: TextField(
        controller: controller,
        cursorColor: locator<AppThemeColors>().primaryColor,
        decoration: InputDecoration(

          filled: true,
          fillColor: locator<AppThemeColors>().light,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: locator<AppThemeColors>().lightGray),
          hintText: hint != null ? 'search $hint name' : 'search vehicle name',

          //  contentPadding: EdgeInsetsDirectional.only( top: 12.sp, bottom: 12.sp),
          border: OutlineInputBorder(

            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Padding(
              padding: EdgeInsetsDirectional.only(
                top: 5.sp,
                //bottom: 5.sp,
              ),
              child: IconButton(
                icon: SvgPicture.asset(
                  ImagesKeys.category,
                  color: locator<AppThemeColors>().lightGray,
                ),
                onPressed: () {},
              )),
          suffixIcon: Padding(
              padding: EdgeInsetsDirectional.only(
                //top: 5.sp,
                //bottom: 5.sp,
              ),
              child: IconButton(
                icon:  Icon(Icons.close_sharp,color: locator<AppThemeColors>().darkGray,),
                onPressed: onClearPressed,
              )),
        ),
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
      ),
    );
  }
}
