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
            child: Drawer(
              child: CustomPaint(
                painter: DrawerPainter(),
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
                                side:
                                    BorderSide(color: Colors.white, width: 1.5),
                              ),
                              onPressed: () {},
                              color: Colors.transparent,
                              textColor: Colors.white,
                              child: Text('Ver perfil',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
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
  CustomListTile(
      {this.index, @required this.iconData, @required this.title, this.number});

  final ValueNotifier<int> number;

  final int index;
  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    if (index == number.value) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: Colors.white12,
          splashColor: Colors.transparent,
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 17.5),
            decoration: BoxDecoration(color: Colors.white24),
            child: ListTile(
              dense: true,
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
          ),
        ),
      );
    } else {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: Colors.white12,
          onTap: () {
            if (index != null){
              number.value = index;
            }
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 17.5),
            child: ListTile(
              dense: true,
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
          ),
        ),
      );
    }
  }
}
