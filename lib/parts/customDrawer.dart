import 'package:flutter/material.dart';
import 'package:uala_clone/parts/curstomListTile.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({this.number});

  final ValueNotifier<int> number;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: CustomPaint(
        painter: DrawerPainter(),
        child: ScrollConfiguration(
          behavior: ScrollBehavior(),
          child: GlowingOverscrollIndicator(
            axisDirection: AxisDirection.down,
            color: Colors.white10,
            child: ListView(
              padding: EdgeInsets.all(0),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 25, horizontal: 17.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Positioned(
                            child: IconButton(
                              icon: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 35,
                                child: Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Colors.grey,
                                )),
                          ),
                          Container(
                            child: Text(
                              'Martín Tomas Olivari Spada',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            width: 200,
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 95),
                        child: RaisedButton(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          splashColor: Colors.transparent,
                          hoverColor: Colors.red,
                          highlightColor: Colors.white54,
                          focusElevation: 0,
                          highlightElevation: 0,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white, width: 1.5),
                          ),
                          onPressed: () {},
                          color: Colors.transparent,
                          textColor: Colors.white,
                          child: Text('Ver perfil',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400)),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    CustomListTile(
                      title: 'Inicio',
                      iconData: Icons.home,
                      index: 0,
                      number: number,
                    ),
                    CustomListTile(
                      title: 'Transferencias',
                      iconData: Icons.swap_vert,
                      index: 1,
                      number: number,
                    ),
                    CustomListTile(
                      title: 'Tarjeta',
                      iconData: Icons.credit_card,
                      index: 2,
                      number: number,
                    ),
                    CustomListTile(
                      title: 'Pagos',
                      iconData: Icons.insert_drive_file,
                      index: 3,
                      number: number,
                    ),
                    CustomListTile(
                      title: 'Inversiones',
                      iconData: Icons.timeline,
                      number: number,
                    ),
                    CustomListTile(
                      title: 'Analisis de gastos',
                      iconData: Icons.pie_chart_outlined,
                      number: number,
                    ),
                  ],
                ),
                Divider(
                  color: Colors.white12,
                  thickness: 1,
                ),
                CustomListTile(
                  title: 'Invitar a un amigo',
                  iconData: Icons.share,
                  number: number,
                ),
                CustomListTile(
                  title: 'Ayuda',
                  iconData: Icons.help_outline,
                  number: number,
                ),
                CustomListTile(
                  title: 'Configuración',
                  iconData: Icons.settings,
                  number: number,
                ),
                CustomListTile(
                  title: 'Cerrar',
                  iconData: Icons.exit_to_app,
                  number: number,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = const Color(0xff7998fe);
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);
    canvas.clipRect(rect);

    paint.color = const Color(0xFFFF686B);
    var circle1 = Offset(size.width * 0.103, size.height * 0.02); //(35,15)
    canvas.drawCircle(circle1, 84.2, paint);

    var circle2 =
        Offset(size.width * 1.044, size.height * 0.994); //(354, 711.24)
    canvas.drawCircle(circle2, 171, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
