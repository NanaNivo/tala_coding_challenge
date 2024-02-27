import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_coding_challenge/app+injection/app.dart';
import 'package:tala_coding_challenge/app+injection/di.dart';
import 'package:tala_coding_challenge/core/helper/screen_util/screen_helper.dart';
import 'package:tala_coding_challenge/core/resources/colors.dart';
import 'package:tala_coding_challenge/core/resources/constants.dart';
import 'package:flutter/material.dart';

import '../../../../core/blocs/application_bloc/app_bloc.dart';

import '../../../custom_widgets/custom_header/custom_header.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  final appBloc = locator<AppBloc>();

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _animation = Tween(begin: 180.0, end: 0.0).animate(_animationController);
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("splash in screen" );
    return

     Scaffold(
        body: SafeArea(
          bottom: true,
          top: false,
          child: Column(
            children: [
              CustomHeader(
                start: locator<AppThemeColors>().primaryColor,
                end: locator<AppThemeColors>().primaryColor,
                additionalHeight: 20,
                bottom: SizedBox(
                  height: ScreensHelper.of(context).fromHeight(30),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedBuilder(
                        animation: _animation,
                        child: SvgPicture.asset(
                          ImagesKeys.splashLogo,
                          color: locator<AppThemeColors>().light,
                          width: 300.r,
                        ),
                        builder: (context, child) {
                          return Positioned(
                            bottom: _animation.value,
                            child: child!,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 120.0.sp),
                  child: Column(
                    children: [
                      LinearProgressIndicator(
                        minHeight: 3.sp,
                        color: locator<AppThemeColors>().primaryColor,
                      ),
                      ScreenUtil().setVerticalSpacing(4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Powered by',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );

  }
}

class GradientBackground extends StatelessWidget {
  final Color beginColor;
  final Color endColor;
  final Widget child;

  const GradientBackground({
    required this.beginColor,
    required this.endColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            beginColor,
            endColor,
          ],
        ),
      ),
      child: child,
    );
  }
}


