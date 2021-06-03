import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class plumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("plumber"),
      ),
      body: Center(
        child: RaisedButton(
          
          onPressed: () {
            Navigator.pop(context);
          },
          child:  Image.asset('asset/maid.png'), 
          //child: Text('Dashboard'),
        ),
      ),
    );
  }
}