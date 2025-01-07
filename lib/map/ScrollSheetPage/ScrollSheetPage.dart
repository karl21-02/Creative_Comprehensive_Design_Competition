import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollSheetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScrollSheetPage();
}

class _ScrollSheetPage extends State<ScrollSheetPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 10,
            child: Container(
              width: 100,
              margin: EdgeInsets.only(top: 5),
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}