import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FamilyTitle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FamilyTitle();

}

class _FamilyTitle extends State<FamilyTitle> {

  final _valueList = ["용인시", "춘천시", "서울시"];
  var _selectedValue = '용인시';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Location", style: TextStyle(fontSize: 12)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.pin_drop, size: 20,),
                  SizedBox(width: 20),
                  DropdownButton<String>(
                    isDense: true,
                    value: _selectedValue,
                    items: _valueList.map(
                          (value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedValue = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('알림'),
                    content: Text('알림을 확인하세요!'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('닫기'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

}