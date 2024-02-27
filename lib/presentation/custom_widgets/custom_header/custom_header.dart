import 'dart:math';


import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tala_coding_challenge/presentation/custom_widgets/custom_header/paint/paint_header.dart';

import '../../../core/helper/screen_util/screen_helper.dart';


class CustomHeader extends StatefulWidget {
  const CustomHeader(
      {super.key,
        this.leading,
        this.action,
        this.bottom,
        this.backgroundColor,
        this.additionalHeight = 0,
        this.height,
        this.start,
        this.end,
        this.padding});

  final Color? backgroundColor;
  final double? height;
  final double additionalHeight;
  final Color? start;
  final Color? end;

  final Widget? leading;
  final Widget? action;
  final Widget? bottom;
  final EdgeInsetsGeometry? padding;

  @override
  State<CustomHeader> createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader>  {
  double height = 0;

  @override
  Widget build(BuildContext context) {


    final padding = height != 0 ? 130 : 100;
    // print(
    //     'height: ${AppBar().preferredSize.height} ${height} ${ScreensHelper.of(context).fromHeight(12)} ${117.sp}');
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: AppBar().preferredSize.height +
          ScreenUtil().statusBarHeight +
            ScreensHelper.of(context).fromHeight(6.5) +
          height +
          widget.additionalHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            painter: HeaderPainter(
                color: widget.backgroundColor ?? Theme.of(context).primaryColor,
                height: widget.height != null
                    ? widget.height! + height + ScreenUtil().statusBarHeight
                    : AppBar().preferredSize.height + height + padding + widget.additionalHeight,
                start: widget.start,
                end: widget.end),
            child: Container(),
          ),
          SafeArea(
            child: Padding(
              padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (widget.leading != null) widget.leading!,
                      if (widget.action != null) widget.action!,
                    ],
                  ),
                  if (widget.bottom != null)
                    MeasureSize(
                        onChange: (Size size) {
                          print('size.height: ${size.height}');
                          setState(() {
                            height = size.height;
                          });
                        },
                        child: widget.bottom!),
                ],
              ),
            ),
          )
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 18.0.sp),
          //   child: Image.asset(ImagesKeys.bigLogo),
          // ),
          // PositionedDirectional(
          //     top: 135.sp + 22.sp,
          //     start: 22.sp,
          //     child: Text(
          //       "${"Last Update at".tr(context)} $date",
          //       style: Theme.of(context)
          //           .textTheme
          //           .labelMedium
          //           ?.copyWith(color: locator<AppThemeColors>().white),
          //     ))
        ],
      ),
    );
  }
}

/*
* SizedBox(
       // padding: EdgeInsets.symmetric(horizontal: 18.sp),

        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 20,
                child: Image.asset(ImagesKeys.bigLogo)),
            // ScreenUtil().setVerticalSpacing(22),
            // Text("dsfsfsdfd")
          ],
        ),
      ),
* */
typedef void OnWidgetSizeChange(Size size);

class MeasureSizeRenderObject extends RenderProxyBox {
  Size? oldSize;
  OnWidgetSizeChange onChange;

  MeasureSizeRenderObject(this.onChange);

  @override
  void performLayout() {
    super.performLayout();

    Size newSize = child!.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onChange(newSize);
    });
  }
}

class MeasureSize extends SingleChildRenderObjectWidget {
  final OnWidgetSizeChange onChange;

  const MeasureSize({
    Key? key,
    required this.onChange,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return MeasureSizeRenderObject(onChange);
  }

  @override
  void updateRenderObject(BuildContext context, covariant MeasureSizeRenderObject renderObject) {
    renderObject.onChange = onChange;
  }
}
