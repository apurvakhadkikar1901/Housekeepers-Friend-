//import 'package:cheaklist/authentication.dart';
import 'package:checklist/Address/addAddress.dart';
import 'package:checklist/Authentication/authentication.dart';
import 'package:checklist/Authentication/profile.dart';
//import 'package:checklist/Authentication/profile.dart';
import 'package:checklist/Authentication/profiles.dart';
import 'package:checklist/Store/storehome.dart';
import 'package:checklist/Vendors/electrician/electricianhome.dart';
import 'package:checklist/Vendors/maidhome.dart';
//import 'package:checklist/Orders/myOrders.dart';
//import 'package:checklist/Store/cart.dart';
//import 'package:checklist/Store/storehome.dart';
//import 'package:checklist/Vendors/main1.dart';
import 'package:checklist/Vendors/my_orders.dart';
import 'package:checklist/Vendors/plumberhome.dart';
import 'package:checklist/Vendors/technician/technicianhome.dart';
import 'package:checklist/Vendors/vendorAuthentication.dart';
import 'package:checklist/Vendors/vendorLogin.dart';
import 'package:flutter/material.dart';
import 'package:checklist/Config/config.dart';
//import 'package:checklist/Authentication/authentication.dart';
// import 'add';
// import 'package:e_shop/Authentication/authenication.dart';
// import 'package:e_shop/Config/config.dart';
// import 'package:e_shop/Address/addAddress.dart';
// import 'package:e_shop/Store/Search.dart';
// import 'package:e_shop/Store/cart.dart';
// import 'package:e_shop/Orders/myOrders.dart';
// import 'package:e_shop/Store/storehome.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';


class MyDrawer extends StatefulWidget{
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
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
              // Material(borderRadius: BorderRadius.all(Radius.circular(80.0)),
              // elevation: 8.0,
              // child:Container(
              //   height: 160.0,
              //   width: 160.0,
              //   child:CircleAvatar(backgroundImage: NetworkImage(EcommerceApp.sharedPreferences.getString(EcommerceApp.userAvatarUrl),
              //   ),)
            

SizedBox(height: 10.0),
Text("Welcome",
style: TextStyle(color: Colors.white,fontSize: 35.0,
fontFamily:"Signatra"),)

            ])
            
            ),
            
            SizedBox(height: 10.0),

Container(padding: EdgeInsets.only(top:1.0),
// decoration: BoxDecoration(
//                 gradient: new LinearGradient(
//               colors: [Colors.blue, Colors.blue[800]],
//               begin: const FractionalOffset(0.0, 0.0),
//               end: const FractionalOffset(1.0, 0.0),
//               stops: [0.0, 1.0],
//               tileMode: TileMode.clamp,
//             ),),
            
            child: Column(children: [
              ListTile(leading: Icon(Icons.supervised_user_circle,color:Colors.blue[600]),
              title:Text("Available Maids",style:TextStyle(color:Colors.black87),),
               onTap: () {
                  Route route = MaterialPageRoute(builder: (c) => StoreHomes());
                  Navigator.pushReplacement(context, route);
                },
 ),
 Divider(height: 10.0, color:Colors.white, //thickness:6.0,
 ),


//  ListTile(leading: Icon(Icons.home,color:Colors.white),
//               title:Text("Home",style:TextStyle(color:Colors.white),),
//                onTap: () {
//                   Route route = MaterialPageRoute(builder: (c) => StoreHome());
//                   Navigator.pushReplacement(context, route);
//                 },
//  ),
//  Divider(height: 10.0, color:Colors.white, thickness:6.0,),



 ListTile(leading: Icon(Icons.supervised_user_circle,color:Colors.blue[600]),
              title:Text("Available Plumbers",style:TextStyle(color:Colors.black87),),
               onTap: () {
                  Route route = MaterialPageRoute(builder: (c) => StoreHomesp());
                  Navigator.pushReplacement(context, route);
                },
 ),
 Divider(height: 10.0, color:Colors.white, //thickness:6.0,
 ),

ListTile(leading: Icon(Icons.supervised_user_circle,color:Colors.blue[600]),
              title:Text("Available Electricians",style:TextStyle(color:Colors.black87),),
               onTap: () {
                  Route route = MaterialPageRoute(builder: (c) => electricianh());
                  Navigator.pushReplacement(context, route);
                },
 ),
 Divider(height: 10.0, color:Colors.white, //thickness:6.0,
 ),
ListTile(leading: Icon(Icons.supervised_user_circle,color:Colors.blue[600]),
              title:Text("Available Technicians",style:TextStyle(color:Colors.black87),),
               onTap: () {
                  Route route = MaterialPageRoute(builder: (c) => technician());
                  Navigator.pushReplacement(context, route);
                },
 ),
 Divider(height: 10.0, color:Colors.white, //thickness:6.0,
 ),


// he me edit kela Donot need Serch Product


//  ListTile(leading: Icon(Icons.home,color:Colors.white),
//               title:Text("Search",style:TextStyle(color:Colors.white),),
//                onTap: () {
//                   Route route = MaterialPageRoute(builder: (c) => SearchProduct());
//                   Navigator.pushReplacement(context, route);
//                 },
//  ),
//  Divider(height: 10.0, color:Colors.white, //thickness:6.0,
//  ),

// ListTile(leading: Icon(Icons.shopping_bag,color:Colors.blue[600]),
//               title:Text("myorders",style:TextStyle(color:Colors.black87),),
//                onTap: () {
//                   Route route = MaterialPageRoute(builder: (c) => MyOrders());
//                   Navigator.pushReplacement(context, route);
//                 },
//  ),
 Divider(height: 10.0, color:Colors.white, //thickness:6.0,
 ),

//  ListTile(leading: Icon(Icons.home,color:Colors.blue[600]),
//               title:Text("History",style:TextStyle(color:Colors.black),),
//                onTap: () {
//                   Route route = MaterialPageRoute(builder: (c) => StoreHome());
//                   Navigator.pushReplacement(context, route);
//                 },
//  ),
//  Divider(height: 10.0, color:Colors.white, //thickness:6.0,
//  ),



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


