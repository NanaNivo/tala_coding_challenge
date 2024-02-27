import 'package:tala_coding_challenge/app+injection/di.dart';
import 'package:tala_coding_challenge/core/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderPainter extends CustomPainter {
  final double height;
  final Color? color;
  final Color? start;
  final Color? end;

  HeaderPainter({this.height = 258, this.color, this.start, this.end});

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;

    var paint = Paint()
      ..strokeWidth = 25.0;
    if(color != null) {
      paint.color = color!;
    }
    if(start != null && end != null ) {
      paint.shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          start!,
          end!,
        ],
      ).createShader(rect);
    }
    paint.style = PaintingStyle.fill;

    final path = Path();

    double height = ScreenUtil().statusBarHeight + this.height.h;

    path.lineTo(0, height);

    path.quadraticBezierTo(10.w, height - 83.h, 140.w, height - 80.h);
    path.lineTo(size.width - 140.w, height - 80.h);
    path.quadraticBezierTo(size.width - 10.w, height - 75.h, size.width, height - 150.h);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(HeaderPainter oldDelegate) {
    return false; // oldDelegate.color != color;
  }
}
