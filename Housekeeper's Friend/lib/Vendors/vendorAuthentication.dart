// import 'package:checklist/Authentication/login.dart';
// import 'package:checklist/Authentication/login.dart';
import 'package:checklist/Vendors/vendorLogin.dart';
import 'package:checklist/Vendors/vendor_register.dart';
import 'package:flutter/material.dart';
// import 'login.dart';
// import 'login.dart';
// import 'register.dart';
//import 'package:checklist/Config/config.dart';


class VendorAuthenticScreen extends StatefulWidget {
  @override
  _VendorAuthenticScreenState createState() => _VendorAuthenticScreenState();
}

class _VendorAuthenticScreenState extends State<VendorAuthenticScreen> {

  @override
  Widget build(BuildContext context)
   {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace:Container(
            decoration: BoxDecoration(
              gradient: new LinearGradient(
                colors: [Colors.blue,Colors.blue[800]],
                begin: const FractionalOffset(0.0,0.0),
                end:const FractionalOffset(1.0,0.0),
                stops:[0.0,1.0],
                tileMode: TileMode.clamp,
                )
                ),
                ) ,
                 title: Text("Users",
                style: TextStyle(fontSize:28.0,color:Colors.white,fontFamily: "Signatra")),
                centerTitle: true,
                 bottom: TabBar(tabs: [
                  Tab(icon: Icon(Icons.lock,color:Colors.white,),
                  text: "Login",),
                  Tab(icon: Icon(Icons.perm_contact_calendar,color:Colors.white,),
                  text: "Register",),
                ],
                indicatorColor: Colors.white38,
                indicatorWeight: 5.0,),               
                ),
                body: Container(
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                colors: [Colors.white,Colors.white],
                begin: Alignment.topRight,
                end:Alignment.bottomLeft,
                )
                  ),
                  child: TabBarView(children: [
                    VendorLogin(),
                    VendorRegister(),
                  ],),
                  ),
                ),
    );
  }
}