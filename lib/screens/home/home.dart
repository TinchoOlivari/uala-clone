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
                          "\$1200,51",
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
                                      Icons.add,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                  Text(
                                    "Carga",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              color: Colors.white,
                              width: 4,
                              thickness: 1.2,
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
                                      size: 16,
                                    ),
                                  ),
                                  Text(
                                    "Inversiones",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
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
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
          Movimiento(title: 'Tomiregis', type: 1, date: '19/12', amount: 0.01),
          Movimiento(
              title: 'Emmanuelcolque', type: 1, date: '19/12', amount: 12.50),
          Movimiento(title: 'Tomyreg_09', type: 0, date: '19/12', amount: 7.15),
          Movimiento(
              title: 'Plata Liberada', type: 2, date: '16/12', amount: 1),
          Movimiento(
              title: 'Plata Liberada', type: 2, date: '16/12', amount: 6.15),
          Movimiento(
              title: 'Plata Invertida', type: 3, date: '03/12', amount: 75.33),
          Movimiento(title: 'Tomiregis', type: 1, date: '19/12', amount: 0.01),
          Movimiento(
              title: 'Emmanuelcolque', type: 1, date: '19/12', amount: 12.50),
          Movimiento(title: 'Tomyreg_09', type: 0, date: '19/12', amount: 7.15),
          Movimiento(
              title: 'Plata Liberada', type: 2, date: '16/12', amount: 1),
          Movimiento(
              title: 'Plata Liberada', type: 2, date: '16/12', amount: 6.15),
          Movimiento(
              title: 'Plata Invertida', type: 3, date: '03/12', amount: 75.33),
        ],
      ),
    );
  }
}

class Movimiento extends StatefulWidget {
  Movimiento(
      {Key key,
      @required this.title,
      @required this.type,
      @required this.date,
      @required this.amount})
      : super(key: key);

  final String title;
  final int type; //0 Enviada - 1 Recibida - 2 Ret de inversion - 3 Invertida
  final String date;
  final double amount;

  @override
  MovimientoState createState() => MovimientoState();
}

class MovimientoState extends State<Movimiento> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.title,
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
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
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      widget.type == 1
                          ? Text('+\$' + widget.amount.toString(),
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500))
                          : widget.type == 0
                              ? Text('\$' + widget.amount.toString(),
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500))
                              : widget.type == 2
                                  ? Text('+\$' + widget.amount.toString(),
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500))
                                  : Text('\$' + widget.amount.toString(),
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                      Text(widget.date,
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 14,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 0.8,
          )
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
