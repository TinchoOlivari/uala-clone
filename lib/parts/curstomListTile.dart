import 'package:flutter/material.dart';

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