import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Image(image: AssetImage('lib/assets/uala-text.png'), width: 50),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.tonality),
            tooltip: 'Next choice',
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(children: [
        CustomPaint(
          painter: ShapesPainter(),
          child: Container(
            height: 200,
          ),
        ),
      ]),
    );
  }
}

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = Colors.blue;
    var path = Path();

    path.lineTo(0, size.height);

    path.cubicTo(
      size.width * 0.125, size.height,
      size.width * 0.125, size.height * 0.85,
      size.width * 0.25, size.height * 0.85
    );

    path.cubicTo(
        size.width * 0.375, size.height * 0.85,
        size.width * 0.375, size.height,
        size.width * 0.5, size.height
    );

    path.cubicTo(
        size.width * 0.625, size.height,
        size.width * 0.625, size.height * 0.85,
        size.width * 0.75, size.height * 0.85,
    );

    path.cubicTo(
        size.width * 0.875, size.height * 0.85,
        size.width * 0.875, size.height,
        size.width, size.height
    );

    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
