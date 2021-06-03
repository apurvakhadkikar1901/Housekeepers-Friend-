import 'package:checklist/Store/storehome.dart';
//import 'package:checklist/Widgets/myDrawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'maidForm.dart';
import 'package:checklist/Widgets/MyDrawerVendor.dart';
class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  
  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser;
   return Scaffold(
     appBar: AppBar(
          // flexibleSpace: Container(
          //   // decoration: BoxDecoration(
          //   //     gradient: new LinearGradient(
          //   //   colors: [Colors.blue, Colors.blue[100]],
          //   //   begin: const FractionalOffset(0.0, 0.0),
          //   //   end: const FractionalOffset(1.0, 0.0),
          //   //   stops: [0.0, 1.0],
          //   //   tileMode: TileMode.clamp,
          //   // )),
          // )
          backgroundColor: Colors.blue[600],
          title: Text("My Orders"),
          centerTitle: true,

          //create shopping icon in app bar
          actions: [
            Stack(children:<Widget> [
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {
                  Route route = MaterialPageRoute(builder: (context) => StoreHome());
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
          drawer:MyDrawerVendor(),
        body: StreamBuilder(
       
       stream: FirebaseFirestore.instance.collection('book').doc(user.uid).collection('user_booking').snapshots(),
            builder: (context,snapshot){
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }
 


              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }
 
              return Material(
                            child: ListView.builder(
                  itemCount:snapshot.data.docs.length,
                  itemBuilder: (context,index){
                   return ClipRRect(
  // borderRadius: BorderRadius.only(
  //   topLeft: Radius.circular(32),
  //   bottomLeft: Radius.circular(32),
  // ),
borderRadius: index != null && index == 0?BorderRadius.only(
          topLeft: Radius.circular(32),
          bottomLeft: Radius.circular(32),
        ):BorderRadius.only(
          topLeft: Radius.circular(0),
          bottomLeft: Radius.circular(0),
        ),

                    child : Container(
                      margin: const EdgeInsets.all(15.0),
  padding: const EdgeInsets.all(3.0),
  decoration: BoxDecoration(
    border: Border.all(width: 5.0,color: Colors.blueAccent)
  ),
                      child: ListTile(
                        focusColor: Colors.white,
            leading: Icon(Icons.people),
                        //padding: const EdgeInsets.only(top: 20.0),
                        title: Text("Name :"+snapshot.data.docs[index]['name']),
                        subtitle: Text("Email ID :"+snapshot.data.docs[index]['email']+ "\nAddress :"+snapshot.data.docs[index]['add']),
                        contentPadding: EdgeInsets.all(10.0),
                      ),
                    ));
                  },
                ),
              );
            }
      
  ),
   );
  }

  
}