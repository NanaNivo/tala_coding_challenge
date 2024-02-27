import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/helper/screen_util/screen_helper.dart';

class LoadingDialog extends StatelessWidget {
  final Color? backgroundColor;

  const LoadingDialog({super.key, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: SimpleDialog(
          backgroundColor: backgroundColor ?? Colors.white38.withOpacity(0.3),
          elevation: backgroundColor == null ? null : 0,
          children: [
            SizedBox(
                height: 100.sp,
                width: ScreensHelper.of(context).fromWidth(100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 35.sp,
                        height: 35.sp,
                        child: const CircularProgressIndicator(
                          strokeWidth: 2,
                        )),
                  ],
                )),
          ]),
    );
  }

  void endLoading(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    }
    // context.pop();
  }
}
