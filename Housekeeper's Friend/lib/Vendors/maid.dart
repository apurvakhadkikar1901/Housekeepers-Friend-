import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class maid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maid"),
      ),
      body: Container(
        
        child: Center(
          
          child: RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
       child:  Image.asset('asset/maid.png'), 
           // child: Text('Dashboard'),
          )
          ,
        ),
      ),
    );
  }
}