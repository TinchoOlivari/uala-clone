import 'package:flutter/material.dart';
import 'package:uala_clone/screens/splash_screen/splash_screen.dart';
import 'package:uala_clone/screens/home/home.dart';
import 'package:uala_clone/parts/customDrawer.dart';

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
  ValueNotifier<int> number = ValueNotifier(0);

  static List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    Center(
      child: Text(
        'Index 1',
      ),
    ),
    Center(
      child: Text(
        'Index 2',
      ),
    ),
    Center(
      child: Text(
        'Index 3',
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      number.value = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: number,
      builder: (context, value, child) {
        return Scaffold(
          drawerScrimColor: Colors.white70,
          body: _widgetOptions.elementAt(value)!= null
              ? _widgetOptions.elementAt(value)
              : _widgetOptions.elementAt(0),
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
            currentIndex: value,
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
            child: CustomDrawer(
              number: number,
            )
          ),
        );
      },
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



