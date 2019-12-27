import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ShapesPainter(),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Center(
              child: Image(image: AssetImage('lib/assets/uala-logo.png'), width: 120)
          ),
          Container(
            height: 80,
            child: FlareActor(
              'lib/assets/dots.flr',
              animation: 'dots',
            ),
          ),
        ],
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

    path.moveTo(size.width * 0.78, size.height);
    path.quadraticBezierTo(
        size.width * 0.93, size.height * 0.92,
        size.width, size.height * 0.77);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.75, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
