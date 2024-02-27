import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_coding_challenge/app+injection/di.dart';
import 'package:tala_coding_challenge/core/navigation/routes.dart';
import 'package:tala_coding_challenge/core/resources/colors.dart';
import 'package:tala_coding_challenge/core/resources/constants.dart';
import 'package:tala_coding_challenge/core/validators/base_validator.dart';
import 'package:tala_coding_challenge/core/validators/email_validator.dart';
import 'package:tala_coding_challenge/core/validators/password_validators.dart';
import 'package:tala_coding_challenge/core/validators/required_validator.dart';
import 'package:tala_coding_challenge/presentation/custom_widgets/CachImage.dart';
import 'package:tala_coding_challenge/presentation/custom_widgets/PrimaryButton.dart';
import 'package:tala_coding_challenge/presentation/custom_widgets/custom_text_field.dart';
import 'package:tala_coding_challenge/presentation/custom_widgets/text_translation.dart';

class LogInPage extends StatefulWidget {
  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
   bool isClicked=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: OrientationBuilder(
          builder: (context,orientation) {
            return Container(
                   //   padding: EdgeInsetsDirectional.symmetric(horizontal: 15.w),
              width: ScreenUtil().screenWidth,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "lib/assets/images/samuel-regan-asante-3BcNKoySAq0-unsplash.jpg",
                      ),
                      fit:BoxFit.fill)),
              child: Column(
                mainAxisAlignment:orientation==Orientation.portrait? MainAxisAlignment.end:MainAxisAlignment.spaceEvenly,
                children: [
             Padding(
               padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
               child:orientation==Orientation.portrait? Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   TextTranslation(
                     "Match",
                     maxLines: 1,
                     withTranslation: false,

                     style: orientation==Orientation.portrait? AppTheme.appTextTheme(locator<AppThemeColors>().white)
                         .displayLarge:AppTheme.appTextTheme(locator<AppThemeColors>().white).displaySmall,
                     textAlign: TextAlign.center,
                   ),

                   TextTranslation(
                     "Through",
                     maxLines: 1,
                     withTranslation: false,

                     style:orientation==Orientation.portrait? AppTheme.appTextTheme(locator<AppThemeColors>().white)
                         .displayLarge:AppTheme.appTextTheme(locator<AppThemeColors>().white).displaySmall
                         ,
                     textAlign: TextAlign.center,
                   ),

                   TextTranslation(
                     "Music",
                     maxLines: 1,
                     withTranslation: false,

                     style: orientation==Orientation.portrait? AppTheme.appTextTheme(locator<AppThemeColors>().white)
                         .displayLarge:AppTheme.appTextTheme(locator<AppThemeColors>().white).displaySmall,
                     textAlign: TextAlign.center,
                   ),
                 ],
               ):Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   TextTranslation(
                     "Match",
                     maxLines: 1,
                     withTranslation: false,

                     style: orientation==Orientation.portrait? AppTheme.appTextTheme(locator<AppThemeColors>().white)
                         .displayLarge:AppTheme.appTextTheme(locator<AppThemeColors>().white).displaySmall,
                     textAlign: TextAlign.center,
                   ),

                   TextTranslation(
                     "Through",
                     maxLines: 1,
                     withTranslation: false,

                     style:orientation==Orientation.portrait? AppTheme.appTextTheme(locator<AppThemeColors>().white)
                         .displayLarge:AppTheme.appTextTheme(locator<AppThemeColors>().white).displaySmall
                     ,
                     textAlign: TextAlign.center,
                   ),

                   TextTranslation(
                     "Music",
                     maxLines: 1,
                     withTranslation: false,

                     style: orientation==Orientation.portrait? AppTheme.appTextTheme(locator<AppThemeColors>().white)
                         .displayLarge:AppTheme.appTextTheme(locator<AppThemeColors>().white).displaySmall,
                     textAlign: TextAlign.center,
                   ),
                 ],
               ),
             ),

                  if(orientation!=Orientation.portrait)
                    ...[
                      ScreenUtil().setVerticalSpacing(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PrimaryButton(
                            onPress: () {
                              context.go(RoutesPath.RegisterPage);
                            },
                            text: 'Create an account',
                            hight: 50.h,
                            width: 150.w,
                            color: locator<AppThemeColors>().green,
                          ),
                       //   ScreenUtil().setHorizontalSpacing(0),
                          PrimaryButton(
                            onPress: () {

                            },
                            text: 'Log in',
                            hight: 50.h,
                            width: 150.w,
                            color: locator<AppThemeColors>().lightGray,
                          ),
                        ],
                      )
                    ]
                  else
                    ...[
                      ScreenUtil().setVerticalSpacing(65),
                      PrimaryButton(
                        onPress: () {
                          context.go(RoutesPath.RegisterPage);
                        },
                        text: 'Create an account',
                        hight: 50.h,
                        width: 300.w,
                        color: locator<AppThemeColors>().green,
                      ),
                      ScreenUtil().setVerticalSpacing(10),
                      PrimaryButton(
                        onPress: () {

                        },
                        text: 'Log in',
                        hight: 50.h,
                        width: 300.w,
                        color: locator<AppThemeColors>().lightGray,
                      ),
                      ScreenUtil().setVerticalSpacing(10),
                    ],

                  TextTranslation('By logging in,you accept the Terms of Use.',withTranslation: false, style: AppTheme.appTextTheme(locator<AppThemeColors>().white)
                      .bodySmall,),
                  TextTranslation('We will never publish anything in your name',withTranslation: false, style: AppTheme.appTextTheme(locator<AppThemeColors>().white)
                      .bodySmall,),
                  ScreenUtil().setVerticalSpacing(20),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
