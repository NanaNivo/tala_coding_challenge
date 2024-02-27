import 'package:flutter/cupertino.dart';

class DrawCircle extends CustomPainter {
 late Paint _paint;
 late double radius;

  DrawCircle({required Color color,required double strokeWidth,required this.radius, PaintingStyle style = PaintingStyle.fill}) {
    _paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = style;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(const Offset(0.0, 0.0), radius, _paint);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}