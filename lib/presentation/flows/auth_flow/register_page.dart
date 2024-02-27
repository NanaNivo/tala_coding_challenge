import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_coding_challenge/app+injection/di.dart';
import 'package:tala_coding_challenge/core/resources/colors.dart';
import 'package:tala_coding_challenge/core/resources/constants.dart';
import 'package:tala_coding_challenge/core/validators/base_validator.dart';
import 'package:tala_coding_challenge/core/validators/email_validator.dart';
import 'package:tala_coding_challenge/core/validators/password_validators.dart';
import 'package:tala_coding_challenge/core/validators/required_validator.dart';
import 'package:tala_coding_challenge/presentation/custom_widgets/CachImage.dart';
import 'package:tala_coding_challenge/presentation/custom_widgets/PrimaryButton.dart';
import 'package:tala_coding_challenge/presentation/custom_widgets/custom_phone_text_field.dart';
import 'package:tala_coding_challenge/presentation/custom_widgets/custom_text_field.dart';
import 'package:tala_coding_challenge/presentation/custom_widgets/text_translation.dart';
import 'package:tala_coding_challenge/presentation/flows/auth_flow/bloc/auth_bloc.dart';
import 'package:tala_coding_challenge/presentation/flows/auth_flow/bloc/auth_event.dart';
import 'package:tala_coding_challenge/presentation/flows/auth_flow/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

class RegisterPage extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final bloc = locator<AuthBloc>();
//The AppTheme.appTextTheme() content condition for different Orientation
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

          backgroundColor: locator<AppThemeColors>().dark,
         flexibleSpace: Align(alignment: AlignmentDirectional.bottomCenter,child: Divider(thickness: 1,color: locator<AppThemeColors>().darkGray,)),
          iconTheme:
          IconThemeData(color: locator<AppThemeColors>().white, size: 25.r),
          actions: [],
        ),
        backgroundColor: locator<AppThemeColors>().dark,
        body: OrientationBuilder(
          builder: (context,orientation) {
            return Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 30.w),
              child: BlocBuilder<AuthBloc, AuthState>(
                bloc:bloc,
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: ResponsiveBreakpoints.of(context).isMobile?MainAxisAlignment.start:MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextTranslation(
                        'Type in your phone number',
                        withTranslation: false,
                        style: AppTheme
                            .appTextTheme(locator<AppThemeColors>().white)
                            .headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                      ScreenUtil().setVerticalSpacing(30),
                      Padding(
                        padding: EdgeInsetsDirectional.symmetric(horizontal: 4.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 9,
                              child: CustomPhoneNumberTextField(
                                hint: '0xxx',
                                onChange: (text) {
                                  print("text in phone${text}");

                                },
                                          onInputValidated: (isValidate){
                                            bloc.add(ValidatePhoneNumber(isValidate));
                                          },
                                // validator: (value) {
                                //   // return    BaseValidator.validateValue(
                                //   //   value,
                                //   //     [
                                //   //       RequiredValidator(),
                                //   //     ],
                                //   //     true
                                //   // ) ;
                                // },
                                //   autovalidateMode: true,
                                //       errorMassege:  BaseValidator.validateValue(
                                //           state.registerState.phoneNumber.isNotEmpty? state.registerState.phoneNumber.split(state.registerState.postCode).last:'',
                                //     [
                                //       RequiredValidator(),
                                //
                                //     ],
                                //    state.validateStep1
                                // ) ,
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.check_circle,
                                  color:state.changeStatus==ValidateStatus.validated?locator<AppThemeColors>().green: locator<AppThemeColors>().darkGray,
                                  size:orientation==Orientation.portrait? 24.r:30.r,
                                )),
                          ],
                        ),
                      ),
                      ScreenUtil().setVerticalSpacing(20),
                      Align(
                        alignment: orientation==Orientation.portrait?AlignmentDirectional.center:AlignmentDirectional.centerEnd,
                        child: PrimaryButton(
                          onPress: () {},
                          width:orientation==Orientation.portrait? 400.w:100.w,
                          hight:orientation==Orientation.portrait? 50.h:80.h,
                          textStyle:
                          AppTheme
                              .appTextTheme(locator<AppThemeColors>().dark)
                              .titleMedium,
                          text: 'Verify my number',
                          color:state.changeStatus==ValidateStatus.validated?locator<AppThemeColors>().green: locator<AppThemeColors>().darkGray,
                        ),
                      )
                    ],
                  );
                },
              ),
            );
          }
        ),
      ),
    );
  }
}
