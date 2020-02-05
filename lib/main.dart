import 'package:flutter/material.dart';
import 'package:uala_clone/screens/splash_screen/splash_screen.dart';
import 'package:uala_clone/screens/home/home.dart';
import 'package:uala_clone/parts/customDrawer.dart';
import 'package:uala_clone/screens/transferencias/transferenciasPage.dart';
import 'package:uala_clone/screens/tarjeta/tarjetaPage.dart';
import 'package:uala_clone/screens/pagos/pagosPage.dart';

void main() => runApp(AppEntry());

class AppEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    TransferenciasPage(),
    TarjetaPage(),
    PagosPage(),
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
            selectedItemColor: Colors.blue[600],
            unselectedIconTheme: IconThemeData(color: Colors.blue[300], size: 26),
            selectedLabelStyle:
                TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            unselectedLabelStyle: TextStyle(fontSize: 11),
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

