//import 'package:cheaklist/authentication.dart';
import 'package:checklist/Address/addAddress.dart';
import 'package:checklist/Authentication/authentication.dart';
import 'package:checklist/Authentication/profile.dart';
import 'package:checklist/Authentication/profile_e.dart';
import 'package:checklist/Authentication/profile_m.dart';
import 'package:checklist/Authentication/profile_p.dart';
//import 'package:checklist/Authentication/profile.dart';
import 'package:checklist/Authentication/profiles.dart';
import 'package:checklist/Vendors/electrician/electricianfome.dart';
import 'package:checklist/Vendors/electrician/my_order_e.dart';
import 'package:checklist/Vendors/electrician/on_click_profile_e.dart';
import 'package:checklist/Vendors/maidForm.dart';
//import 'package:checklist/Orders/myOrders.dart';
//import 'package:checklist/Store/cart.dart';
//import 'package:checklist/Store/storehome.dart';
import 'package:checklist/Vendors/main1.dart';
import 'package:checklist/Vendors/myOrder_p.dart';
import 'package:checklist/Vendors/my_order_m.dart';
import 'package:checklist/Vendors/my_orders.dart';
import 'package:checklist/Vendors/on_click_profile_m.dart';
import 'package:checklist/Vendors/vendorAuthentication.dart';
import 'package:flutter/material.dart';
import 'package:checklist/Config/config.dart';



class MyDrawerVendorMaid extends StatefulWidget{
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawerVendorMaid> {
  Record1 record;

  
 // Record1 record;

  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(children: [
        Container(padding:EdgeInsets.only(top:25.0,bottom:10.0),
        decoration: BoxDecoration(
                gradient: new LinearGradient(
              colors: [Colors.blue, Colors.blue[800]],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),),
        child:Column(children:[
              
            

SizedBox(height: 10.0),
Text("Welcome",
style: TextStyle(color: Colors.white,fontSize: 35.0,
fontFamily:"Signatra"),)

            ])
            
            ),
            
            SizedBox(height: 10.0),

Container(padding: EdgeInsets.only(top:1.0),

            
            child: Column(children: [
              ListTile(leading: Icon(Icons.home,color:Colors.blue[600]),
              title:Text("Home",style:TextStyle(color:Colors.black87),),
               onTap: () {
                  Route route = MaterialPageRoute(builder: (c) => MyAppp());
                  Navigator.pushReplacement(context, route);
                },
 ),
 Divider(height: 10.0, color:Colors.white, //thickness:6.0,
 ),


ListTile(leading: Icon(Icons.shopping_bag,color:Colors.blue[600]),
              title:Text("View Others Profile",style:TextStyle(color:Colors.black87),),
               onTap: () {
                  Route route = MaterialPageRoute(builder: (c) => ProfileM());
                  Navigator.pushReplacement(context, route);
                },
 ),
 Divider(height: 10.0, color:Colors.white, //thickness:6.0,
 ),



//  ListTile(leading: Icon(Icons.shopping_bag,color:Colors.blue[600]),
//               title:Text("Profile",style:TextStyle(color:Colors.black87),),
//                onTap: () {
//                   Route route = MaterialPageRoute(builder: (c) => ProfilePM(record,context));
//                   Navigator.pushReplacement(context, route);
//                 },
//  ),
 Divider(height: 10.0, color:Colors.white, //thickness:6.0,
 ),







 ListTile(leading: Icon(Icons.home,color:Colors.blue[600]),
              title:Text("MyOrders",style:TextStyle(color:Colors.black),),
               onTap: () {
                  Route route = MaterialPageRoute(builder: (c) => OrderHomesM());
                  Navigator.pushReplacement(context, route);
                },
 ),
 Divider(height: 10.0, color:Colors.white, //thickness:6.0,
 ),



 ListTile(leading: Icon(Icons.logout,color:Colors.blue[600]),
              title:Text("Logout",style:TextStyle(color:Colors.black87),),
               onTap: () {

                  EcommerceApp.auth.signOut().then((c) {
                    Route route = MaterialPageRoute(builder: (c) => VendorAuthenticScreen());
                  Navigator.pushReplacement(context, route);

                  });


                  
                },
 ),
 Divider(height: 10.0, color:Colors.white, //thickness:6.0,
 ),

  ],)
            
            )

            
            ],),);
  }
}