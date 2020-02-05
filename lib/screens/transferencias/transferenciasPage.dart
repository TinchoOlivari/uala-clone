import 'package:flutter/material.dart';

class TransferenciasPage extends StatefulWidget {
  TransferenciasPage({Key key}) : super(key: key);

  @override
  _TransferenciasPageState createState() => _TransferenciasPageState();
}

class _TransferenciasPageState extends State<TransferenciasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Transferencias',
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20, 18, 20, 18),
            child: Text(
              '¿A quien le querés mandar plata?',
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 15),
            child: Text(
              'Contactos Ualá',
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w600),
            ),
          ),
          Contacto(name: 'Ivan Luis Nuñez', date: '28/11/2019'),
          Contacto(name: 'Juan Cruz Mare', date: '18/11/2019'),
          Contacto(name: 'Fabrizio Agustin Olivari Spada', date: '05/10/2019'),
          Contacto(name: 'Elias Ivan Alaniz', date: '10/09/2019'),
          Spacer(),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 25),
            child: Column(
              children: <Widget>[
                RaisedButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.white54,
                    focusElevation: 4,
                    highlightElevation: 4,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    onPressed: () {},
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: Center(
                        child: Text(
                          'Nueva transferencia',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                    )),
                RaisedButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.blue[180],
                    focusElevation: 0,
                    highlightElevation: 0,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    onPressed: () {},
                    color: Colors.transparent,
                    textColor: Colors.blue,
                    child: SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.photo_camera,
                              color: Colors.blue,
                              size: 25,
                            ),
                          ),
                          Text(
                            'Escanear QR',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Contacto extends StatefulWidget {
  Contacto({
    Key key,
    @required this.name,
    @required this.date,
  }) : super(key: key);

  final String name;
  final String date;

  @override
  ContactoState createState() => ContactoState();
}

class ContactoState extends State<Contacto> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 17, 20, 17),
          child: Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CircleAvatar(
                    child: Text(
                      widget.name[0],
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: const Color(0xFFFF686B),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.name,
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      Text(
                        '${'Última transferencia ' + widget.date}',
                        style: TextStyle(color: Colors.black54),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          thickness: 0.8,
          height: 0,
        )
      ],
    );
  }
}
