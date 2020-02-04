import 'package:flutter/material.dart';

class PagosPage extends StatefulWidget {
  PagosPage({Key key}) : super(key: key);

  @override
  _PagosPageState createState() => _PagosPageState();
}

class _PagosPageState extends State<PagosPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(161),
        child: CustomPaint(
          painter: ShapesPainter(),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Pagos y recargas',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(105.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(5),
                      child: TextField(
                        onChanged: (value) {},
                        controller: null,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Buscar empresa o rubro",
                          hintStyle:
                              TextStyle(fontSize: 14, color: Colors.black45),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                  ),
                  getTabBar()
                ],
              ),
            ),
          ),
        ),
      ),
      body: getTabBarPages(),
    );
  }

  Widget getTabBar() {
    return TabBar(
        controller: tabController,
        tabs: [
          Tab(
            text: 'Recargas',
          ),
          Tab(
            text: 'Pagos',
          )
        ],
        labelColor: Colors.white,
        indicatorColor: Colors.white);
  }

  Widget getTabBarPages() {
    return TabBarView(controller: tabController, children: <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Recargas más usadas',
                  style: TextStyle(color: Colors.black54),
                ),
                Text('Ver todas',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w500))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 13, left: 5, bottom: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TipoRecarga(
                    title: 'SUBE',
                    color: Colors.blue,
                  ),
                  TipoRecarga(
                    title: 'Claro',
                    color: Colors.red,
                  ),
                  TipoRecarga(
                    title: 'Movistar',
                    color: Colors.green,
                  ),
                  TipoRecarga(
                    title: 'Personal',
                    color: Colors.lightBlue,
                  ),
                  TipoRecarga(
                    title: 'Tuenti',
                    color: Colors.blueAccent[800],
                  ),
                  TipoRecarga(
                    title: 'Nextel',
                    color: Colors.deepOrange,
                  ),
                  TipoRecarga(
                    title: 'Directv',
                    color: Colors.lightBlueAccent,
                  ),
                  TipoRecarga(
                    title: 'Antina',
                    color: Colors.green,
                  ),
                  TipoRecarga(
                    title: 'GranDT',
                    color: Colors.blue[700],
                  ),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 0.8,
            height: 30
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
            child: Text('Últimas recargas', style: TextStyle(color: Colors.black54),),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Recarga(
                  title: 'Tuenti',
                  type: 'Servicios',
                  ammount: '190.0',
                  date: '17/10/2019',
                ),
                Recarga(
                  title: 'Tuenti',
                  type: 'Servicios',
                  ammount: '100.0',
                  date: '17/10/2019',
                ),
              ],
            ),
          )
        ],
      ),
      Container(color: Colors.green),
    ]);
  }
}

class TipoRecarga extends StatelessWidget {
  TipoRecarga({
    Key key,
    @required this.color,
    @required this.title,
  }) : super(key: key);

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(child: Container(), backgroundColor: color),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.clip,
              style: TextStyle(color: Colors.black54),
            ),
          )
        ],
      ),
    );
  }
}

class Recarga extends StatelessWidget {
  Recarga({
    Key key,
    @required this.title,
    @required this.type,
    @required this.ammount,
    @required this.date,
  }) : super(key: key);

  final String title;
  final String type;
  final String ammount;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(title, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(type, style: TextStyle(color: Colors.black54)),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text('\$ $ammount ', style: TextStyle(fontSize: 16, color: Colors.black54)),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(date, style: TextStyle(color: Colors.black54)),
                    )
                  ],
                ),
              ],
            )
        ),
        Divider(
            thickness: 0.8,
            height: 20
        ),
      ],
    );
  }
}


class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final blue_paint = Paint()..color = Colors.blue;
    var blue_path = Path();
    blue_path.moveTo(0, 0);
    blue_path.lineTo(0, size.height);
    blue_path.lineTo(size.width, size.height);
    blue_path.lineTo(size.width, 0);
    blue_path.close();

    final paint = Paint()..color = Colors.blue[400];
    var path = Path();
    path.moveTo(0, size.height - 10);
    path.cubicTo(
        size.width / 2, size.height, size.width / 2, 80, size.width, 80);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(blue_path, blue_paint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


