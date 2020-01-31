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
        CustomPaint(
          painter: ShapesPainter(),
          child: Container()
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.black54,),
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
    final paint = Paint();
    paint.color = Colors.blue;
    var statusbar_path = Path();
    statusbar_path .lineTo(0, 24);
    statusbar_path .lineTo(size.width, 24);
    statusbar_path .lineTo(size.width, 0);
    statusbar_path .close();
    canvas.drawPath(statusbar_path, paint);

    final paint2 = Paint();

    paint2.color = Colors.red;
    var path = Path();

    path.moveTo(0, 24);
    path.lineTo(0, 100);
    path.quadraticBezierTo(
        size.width / 2, 135,
        size.width, 100
    );
    path.lineTo(size.width, 24);
    path.close();

    canvas.drawPath(path, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}