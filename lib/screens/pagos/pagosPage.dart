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
      Container(color: Colors.transparent),
      Container(color: Colors.green),
    ]);
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
        size.width / 2, size.height,
        size.width / 2, 80,
        size.width, 80);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(blue_path, blue_paint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
