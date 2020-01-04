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

class _AppState extends State<App> {
  int _selectedIndex = 0;

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
        unselectedIconTheme: IconThemeData(color: Colors.blue,size: 26),
        selectedLabelStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
        unselectedLabelStyle: TextStyle(fontSize: 12),
      ),
        drawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.787,
          child: Drawer(
            child: CustomPaint(
              painter: DrawerPainter(),
              child: Container(),
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

    var circle2 = Offset(size.width * 1.044, size.height * 0.994); //(354, 711.24)
    canvas.drawCircle(circle2, 171, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

