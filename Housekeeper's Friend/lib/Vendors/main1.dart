

import 'package:checklist/Store/storehome.dart';
import 'package:checklist/Vendors/electrician/electricianfome.dart';

import 'package:checklist/Vendors/maidForm.dart';
import 'package:checklist/Vendors/my_orders.dart';
import 'package:checklist/Vendors/plumberform.dart';
import 'package:checklist/Vendors/technician/technicianhome.dart';
import 'package:checklist/Vendors/technician/technicianfom.dart';
import 'package:checklist/Widgets/MyDrawerVendor.dart';
import 'package:checklist/Widgets/myDrawer.dart';
import 'package:flutter/material.dart';
//import 'main1.dart';
// import 'package:flutter_app/menu.dart';
// import 'package:flutter_app/profile.dart';
// import 'package:flutter_app/settings.dart';
// import 'package:flutter_app/about.dart';

import 'electrician.dart';
import 'technician.dart';
import 'plumber.dart';
import 'maid.dart';

main() {
  runApp(
      MaterialApp(
    home: MyAppp(),

  ));
}

class MyAppp extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.blue[600],
        title: Text("DashBoard",),
        actions: [
            Stack(children:<Widget> [
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {
                  Route route = MaterialPageRoute(builder: (context) => MyOrders());
                  Navigator.pushReplacement(context, route);
                },
              ),
              Positioned(
                child: Stack(
                  children: [
                    Icon(
                      Icons.brightness_1,
                      size: 20.0,
      
                      color: Colors.black,
                    ),
                  ],
                ),
              )
            ]),
          ]
      ),
      drawer: MyDrawerVendor(),
      body: Center(
          child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: 
                  new MaterialButton(
                    height: 180.0,
                    minWidth: 160.0,
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    child:new Column(
                      mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Image.asset('images/maid.png',
                              height: 60.0, width: 50.0),
                          Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: new Text(
                                "Maid  ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ))
                        ],
                    ),
                    //child: new Text("maid",),
                    
                    onPressed: () => {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Maid()),
                    )
                    },
                    
                    splashColor: Colors.redAccent,
                  )),
              Padding(
                
                  padding: EdgeInsets.all(10.0),
                  child: new MaterialButton(
                    height: 180.0,
                    minWidth: 160.0,
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    child:new Column(
                      mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Image.asset('images/electrician.png',
                              height: 60.0, width: 50.0),
                          Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: new Text(
                                "Electrician  ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ))
                        ],
                    ),
                   
                    onPressed: () => {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Electrician()),
                    )
                    },
                    splashColor: Colors.redAccent,
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: new MaterialButton(
                    height: 180.0,
                    minWidth: 160.0,
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    child:new Column(
                      mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Image.asset('images/technician.png',
                              height: 60.0, width: 50.0),
                          Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: new Text(
                                "Technician ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ))
                        ],
                    ),
                    //child: new Text("technician"),
                    onPressed: () => {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Techniciant()),
                    )
                    },
                    splashColor: Colors.redAccent,
                  )),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: new MaterialButton(
                    height: 180.0,
                    minWidth: 160.0,
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                   // child: new Text("plumber"),
                    child:new Column(
                      mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Image.asset('images/plumber.jpg',
                              height: 60.0, width: 50.0),
                          Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: new Text(
                                "Plumber  ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ))
                        ],
                    ),
                    onPressed: () => {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Plumber()),
                    )
                    },
                    splashColor: Colors.redAccent,
                  )),
            ],
          ),

        ],
      )),
    );
  }
}
