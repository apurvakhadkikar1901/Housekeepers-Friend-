
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData data;
  final String hintText;
  bool isObsecure = true;

  CustomTextField(
      {Key key, this.controller, this.data, this.hintText, this.isObsecure, Color color, TextStyle style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.blue[400],
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.all(10.0),
        child: TextFormField(
          controller: controller,
          style:TextStyle(color: Colors.white),
          obscureText: isObsecure,
          cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(data, color: Colors.white,),
              focusColor: Colors.white,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.white),
              //textStyle:TextStyle(color: Colors.white)
              ),
        ));
  }
}

