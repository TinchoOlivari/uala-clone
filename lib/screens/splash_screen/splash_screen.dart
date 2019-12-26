import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ShapesPainter(),
      child: Container(
        child: Column(),
      ),
    );
  }
}

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.white;
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);

    paint.color = const Color(0xffffefef);
    var center = Offset(30, 30);
    canvas.drawCircle(center, 140.0, paint);

    paint.color = const Color(0xffeff3fe);
    var path = Path();

    path.moveTo(size.width * 0.8, size.height);
    path.quadraticBezierTo(
        size.width * 0.9, size.height * 0.92, size.width, size.height * 0.75);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.75, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
