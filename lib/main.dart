import 'package:flutter/material.dart';
import 'package:uala_clone/screens/splash_screen/splash_screen.dart';
import 'package:uala_clone/screens/home/home.dart';

void main() => runApp(AppEntry());

class AppEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child,
          );
        },
        title: 'Ualá',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen());
  }
}

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

int _selectedIndex = 0;

class _AppState extends State<App> {
  static List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    Text(
      'Index 1: Business',
    ),
    Text(
      'Index 1: Business',
    ),
    Text(
      'Index 1: Business',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.white70,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Incio'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_vert),
            title: Text('Transferencias'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            title: Text('Tarjeta'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_drive_file),
            title: Text('Pagos'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        iconSize: 23,
        selectedItemColor: Colors.blue,
        unselectedIconTheme: IconThemeData(color: Colors.blue, size: 26),
        selectedLabelStyle:
            TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
        unselectedLabelStyle: TextStyle(fontSize: 12),
      ),
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.787,
        child: Drawer(
          child: CustomPaint(
            painter: DrawerPainter(),
            child: Container(
              child: Column(
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
                                onPressed: null,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 25),
                              child: CircleAvatar(radius: 35),
                            ),
                            Container(
                              child: Text(
                                'Martín Tomas Olivari Spada',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
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
                      ),
                      CustomListTile(
                        title: 'Transferencias',
                        iconData: Icons.swap_vert,
                        index: 1,
                      ),
                      CustomListTile(
                        title: 'Tarjeta',
                        iconData: Icons.credit_card,
                        index: 2,
                      ),
                      CustomListTile(
                        title: 'Pagos',
                        iconData: Icons.insert_drive_file,
                        index: 3,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
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

class CustomListTile extends StatelessWidget {
  CustomListTile({this.index, this.iconData, this.title});

  final int index;
  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    if (index == _selectedIndex) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 17.5),
        decoration: BoxDecoration(color: Colors.white24),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text(title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400)),
          leading: Icon(
            iconData,
            size: 25,
            color: Colors.white,
          ),
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 17.5),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text(title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400)),
          leading: Icon(
            iconData,
            size: 25,
            color: Colors.white,
          ),
        ),
      );
    }
  }
}
