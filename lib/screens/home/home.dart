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
      body: ListView(
        children: [
          CustomPaint(
            painter: ShapesPainter(),
            child: Container(
                height: 160,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 80,
                      child: Center(
                        child: Text(
                          "\$12,51",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FlatButton(
                              onPressed: null,
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.add_circle_outline,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  Text(
                                    "Carga",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              color: Colors.white,
                              width: 5,
                              thickness: 1.5,
                            ),
                            FlatButton(
                              onPressed: null,
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.show_chart,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  Text(
                                    "Inversiones",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
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

    paint.color = Colors.blue;
    var path = Path();

    path.lineTo(0, size.height);

    path.cubicTo(size.width * 0.125, size.height, size.width * 0.125,
        size.height * 0.85, size.width * 0.25, size.height * 0.85);

    path.cubicTo(size.width * 0.375, size.height * 0.85, size.width * 0.375,
        size.height, size.width * 0.5, size.height);

    path.cubicTo(
      size.width * 0.625,
      size.height,
      size.width * 0.625,
      size.height * 0.85,
      size.width * 0.75,
      size.height * 0.85,
    );

    path.cubicTo(size.width * 0.875, size.height * 0.85, size.width * 0.875,
        size.height, size.width, size.height);

    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
