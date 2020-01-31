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

    final circles = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = Colors.red;
    var cricle_path = Path();
    cricle_path.addOval(
        Rect.fromLTWH(size.width * 0.545, size.height * 0.062, 12, 12));
    cricle_path
        .addOval(Rect.fromLTWH(size.width * 0.84, size.height * 0.060, 21, 21));
    cricle_path
        .addOval(Rect.fromLTWH(size.width * 0.73, size.height * 0.1, 16, 16));
    cricle_path
        .addOval(Rect.fromLTWH(size.width * 0.30, size.height * 0.12, 14, 14));

    final circle_red = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = Colors.grey;
    var cricle_path_red = Path();
    cricle_path_red
        .addOval(Rect.fromLTWH(size.width * 0.26, size.height * 0.065, 12, 12));

    canvas.drawPath(statusbar_path, paint);
    canvas.drawPath(path, paint2);
    canvas.drawPath(cricle_path, circles);
    canvas.drawPath(cricle_path_red, circle_red);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
