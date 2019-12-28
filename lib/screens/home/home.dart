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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Movimientos',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black54),
                  ),
                  IconButton(
                      icon: Icon(Icons.tune, color: Colors.blue),
                      onPressed: null),
                ],
              ),
            ),
          ),
          Movimiento(
            person: 'Tomiregis',
            type: 1,
            date: '20',
            amount: 1,
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

class Movimiento extends StatefulWidget {
  Movimiento(
      {Key key,
      @required this.person,
      @required this.type,
      @required this.date,
      @required this.amount})
      : super(key: key);

  final String person;
  final int type; //0 Enviada - 1 Recibida - 2 Invertida
  final String date;
  final double amount;

  @override
  MovimientoState createState() => MovimientoState();
}

class MovimientoState extends State<Movimiento> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Container(
        child: Row(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image(
                    image: AssetImage(widget.type == 0
                        ? 'lib/assets/flechas-arriba.png'
                        : widget.type == 1
                            ? 'lib/assets/flechas-abajo.png'
                            : 'lib/assets/invertido.png'),
                    width: 35)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.person,
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.5),
                ),
                Text(
                  widget.type == 0
                      ? 'Transferencia enviada'
                      : widget.type == 1
                          ? 'Transferencia recibida'
                          : 'Inversiones',
                  style: TextStyle(color: Colors.black38),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
