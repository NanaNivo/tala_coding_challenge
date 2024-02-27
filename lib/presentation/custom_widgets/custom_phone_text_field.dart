import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart' as intl ;
import 'package:tala_coding_challenge/app+injection/di.dart';
import 'package:tala_coding_challenge/core/resources/colors.dart';
import 'package:tala_coding_challenge/core/resources/constants.dart';
import 'package:tala_coding_challenge/presentation/flows/auth_flow/widgets/phone_number_input.dart';
import 'package:tala_coding_challenge/presentation/flows/auth_flow/widgets/selector_config.dart';

class CustomPhoneNumberTextField extends StatefulWidget {
  const CustomPhoneNumberTextField({
    super.key,
    this.hint,
    this.controller,
    this.onChange,
    this.validator,
    this.errorMassege,
    this.autovalidateMode,
    this.onInputValidated
  });

  final String? hint;
  final TextEditingController? controller;
  final Function(intl.PhoneNumber text)? onChange;
  final String? Function(String?)? validator;
 final  Function(bool)? onInputValidated;
  final String? errorMassege;
  final bool? autovalidateMode;

  @override
  State<CustomPhoneNumberTextField> createState() => _CustomPhoneNumberTextFieldState();
}

class _CustomPhoneNumberTextFieldState extends State<CustomPhoneNumberTextField> {
  @override
  Widget build(BuildContext context) {
    print("phone Number auto${widget.autovalidateMode}");
    return InternationalPhoneNumberInputCustom(
         textFieldController: widget.controller,

    //  initialValue: PhoneNumber(dialCode:'+963',isoCode: 'SY' ),
      textStyle: AppTheme.appTextTheme(locator<AppThemeColors>().white).bodyMedium,
      onInputChanged: widget.onChange,
      onInputValidated:widget.onInputValidated,
      hintText: widget.hint,

      selectorConfig:  SelectorConfigCustom(
        selectorType:ScreenUtil().orientation==Orientation.portrait?PhoneInputSelectorTypeCustom.BOTTOM_SHEET: PhoneInputSelectorTypeCustom.DIALOG,
      //  setSelectorButtonAsPrefixIcon:true,
        useEmoji: false,
       showFlags: true,
      ),
      selectorTextStyle:TextStyle(color: locator<AppThemeColors>().white) ,
       countrySelectorScrollControlled:ScreenUtil().orientation==Orientation.portrait? false:true,
      validator: widget.validator,
      cursorColor: locator<AppThemeColors>().green,
      searchBoxDecoration: InputDecoration(
          fillColor: locator<AppThemeColors>().lightGray,
          filled: true,
        ),
      inputBorder: OutlineInputBorder(

          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: locator<AppThemeColors>().primaryColor, width: 1.sp)),
      inputDecoration: InputDecoration(
        hintText: widget.hint,
    //prefixText: '999',
        prefixStyle: TextStyle(color: locator<AppThemeColors>().white),
        filled: true,
       fillColor: locator<AppThemeColors>().blankLight,
        hintStyle: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: locator<AppThemeColors>().darkGray),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.r),
            borderSide: BorderSide(color: locator<AppThemeColors>().error, width: 1.sp)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.r),
            borderSide: BorderSide(color: locator<AppThemeColors>().transparent, width: 1.sp)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.r),
            borderSide: BorderSide(color: locator<AppThemeColors>().transparent, width: 1.sp)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35.r),
          borderSide: BorderSide(color: locator<AppThemeColors>().transparent, width: 1.sp)),

        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 14.w),
      ),
      // autoValidateMode: AutovalidateMode.onUserInteraction,
      autoValidateMode: AutovalidateMode.onUserInteraction,

    );
  }
}