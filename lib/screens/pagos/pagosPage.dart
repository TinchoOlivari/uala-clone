import 'package:flutter/material.dart';

class PagosPage extends StatefulWidget {
  PagosPage({Key key}) : super(key: key);

  @override
  _PagosPageState createState() => _PagosPageState();
}

class _PagosPageState extends State<PagosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(5),
              child: TextField(
                onChanged: (value) {},
                controller: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Buscar empresa o rubro",
                  hintStyle: TextStyle(fontSize: 14, color: Colors.black45),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black38,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
