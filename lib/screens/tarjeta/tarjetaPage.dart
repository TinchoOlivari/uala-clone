import 'package:flutter/material.dart';

class TarjetaPage extends StatefulWidget {
  TarjetaPage({Key key}) : super(key: key);

  @override
  _TarjetaPageState createState() => _TarjetaPageState();
}

class _TarjetaPageState extends State<TarjetaPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomPaint(painter: ShapesPainter(), child: Container()),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black54,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
      ],
    );
  }
}

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    num degToRad(num deg) => deg * (3.14159265359 / 180.0);

    final paint = Paint()..color = Colors.blue;
    var statusbar_path = Path();
    statusbar_path.lineTo(0, 24);
    statusbar_path.lineTo(size.width, 24);
    statusbar_path.lineTo(size.width, 0);
    statusbar_path.close();

    final paint2 = Paint()..color = Colors.white;
    var path = Path();
    path.moveTo(0, 24);
    path.lineTo(0, 100);
    path.quadraticBezierTo(size.width / 2, 135, size.width, 100);
    path.lineTo(size.width, 24);
    path.close();

    final red_paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = Colors.red[200];
    var red_path = Path();
    red_path.addOval(
        Rect.fromLTWH(size.width * 0.545, size.height * 0.062, 12, 12));
    red_path
        .addOval(Rect.fromLTWH(size.width * 0.84, size.height * 0.060, 21, 21));
    red_path
        .addOval(Rect.fromLTWH(size.width * 0.73, size.height * 0.1, 16, 16));
    red_path
        .addOval(Rect.fromLTWH(size.width * 0.30, size.height * 0.12, 14, 14));
    red_path.arcTo(Rect.fromLTWH(size.width * 0.13, size.height * 0.12, 14, 14),
        degToRad(-90), degToRad(90), true);

    final grey_paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = Colors.grey[400];
    var grey_path = Path();
    grey_path
        .addOval(Rect.fromLTWH(size.width * 0.26, size.height * 0.062, 12, 12));
    grey_path.arcTo(
        Rect.fromLTWH(size.width * 0.718, size.height * 0.094, 16, 16),
        degToRad(-180),
        degToRad(90),
        true);

    final blue_paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = Colors.blue[300];
    var blue_path = Path();
    blue_path.arcTo(
        Rect.fromLTWH(size.width * 0.283, size.height * 0.11, 25, 25),
        degToRad(-180),
        degToRad(90),
        true);
    blue_path.arcTo(
        Rect.fromLTWH(size.width * 0.4, size.height * 0.074, 15, 15),
        degToRad(-135),
        degToRad(180),
        true);
    blue_path.arcTo(
        Rect.fromLTWH(size.width * 0.605, size.height * 0.063, 23, 23),
        degToRad(0),
        degToRad(90),
        true);
    blue_path.arcTo(
        Rect.fromLTWH(size.width * 0.82, size.height * 0.052, 35, 35),
        degToRad(-180),
        degToRad(-90),
        true);

    canvas.drawPath(statusbar_path, paint);
    canvas.drawPath(path, paint2);
    canvas.drawPath(red_path, red_paint);
    canvas.drawPath(grey_path, grey_paint);
    canvas.drawPath(blue_path, blue_paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
