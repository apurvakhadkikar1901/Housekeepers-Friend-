import 'package:checklist/Authentication/login.dart';
import 'package:checklist/Authentication/profile.dart';
import 'package:checklist/Vendors/maidForm.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter_otp_auth/home.dart';
//import 'package:flutter_otp_auth/login.dart';
//import 'package:flutter_otp_auth/profile.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomePage(title: 'Home Page');
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Record1 record;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: new Text("HouseKeeper's Friend", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Open Sans', fontWeight: FontWeight.bold)),
        leading: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Image.asset(
            "assets/houselogo.PNG",
            scale: 8.0,
          )
        )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   'You have pushed the button this many times:',
            // ),
            Container(
                height: 150,
                  width: 200,
                  child: Image.asset('assets/housekeep.PNG')),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Who are you?',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 40),
                Container(
                  // width: double.infinity,
                  width: MediaQuery.of(context).size.width,
                  //height: 10,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Column(
                          children: [
                            RaisedButton(
                              onPressed: () {

                                Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>Login()),
                            );
                              },
                              padding: EdgeInsets.all(12),
                              elevation: 5,
                              child: Text(
                                "Service Provider",
                                style: TextStyle(color: Colors.black),
                              ),
                              color: Colors.grey[400],
                              // padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            ),
                            RaisedButton(
                              onPressed: () {

                                Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>Profile()),
                            );
                              },
                              padding: EdgeInsets.all(2),
                              elevation: 5,
                              child: Text(
                                "Service Taker",
                                style: TextStyle(color: Colors.black),
                              ),
                              color: Colors.grey[400],
                              // padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            ),
                             RaisedButton(
              child: Text('Logout'),
              onPressed: () async {
                await _auth.signOut();
                Navigator.of(context).pushReplacementNamed('/loginpage');
              },
            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
            // RaisedButton(
            //   child: Text('Logout'),
            //   onPressed: () async {
            //     await _auth.signOut();
            //     Navigator.of(context).pushReplacementNamed('/loginpage');
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
