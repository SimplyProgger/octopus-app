import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FourFragment extends StatefulWidget {
 @override
  FourFragmentState createState() => FourFragmentState();
}

class FourFragmentState extends State<FourFragment> {

  bool _value1 = false;

  void _onChanged1(bool value) => setState(() => _value1 = value);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        SwitchListTile(
          contentPadding: EdgeInsets.only(left: 25,right: 30,top: 25),
          onChanged: _onChanged1,
          value: _value1,
          title: Text('Отправлять уведомления',style: TextStyle(fontSize: 20),),
        )
      ],
    );
  }
}