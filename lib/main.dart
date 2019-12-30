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
        title: 'Uala',
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
