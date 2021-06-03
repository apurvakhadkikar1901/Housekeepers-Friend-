
import 'package:checklist/Counters/cartitemcounter.dart';
import 'package:checklist/Store/storehome.dart';
import 'package:checklist/Vendors/alert_user.dart';
import 'package:checklist/Vendors/date-time_picker.dart';
import 'package:checklist/Vendors/electricianfom.dart';
import 'package:checklist/Vendors/maidForm.dart';
import 'package:checklist/Vendors/phone_sms_calle.dart';
//import 'package:checklist/Vendors/maidhome.dart';
import 'package:checklist/Widgets/myDrawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'dart:math';
import 'phone_sms_call.dart';

class PhoneFetche extends StatelessWidget {
  Recorde record;
  BuildContext context;

  File file;
  String imageURL;

  String name,email,startDate,time,adharcard,hours,add,url;

  var storage;

  getTaskName(name){
    this.name=name;
  }
  getTaskAdd(add){
    this.add=add;
  }
  getTaskEmail(email){
    this.email=email;
  }
  getTaskDate(startDate){
    this.startDate=startDate;
  }
  getTaskTime(time){
    this.time=time;
  }
  // getTaskAdhar(adharcard){
  //   this.adharcard=adharcard;
  // }
  getTaskhour(hours){
    this.hours=hours;
  }
  // getTaskurl(text) async {
  //   FirebaseStorage storage = FirebaseStorage.instance;
  //   final ref = storage.ref().child(text);
  //   var url = await ref.getDownloadURL();
  //   //this.url=url;
  // }

  int _myTaskType = 0;
  String taskVal;

  PhoneFetche(this.record, this.context);
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return  Scaffold(
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
          title: Text("My favourite"),
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
                  Positioned(
                      top:3.0,
                      bottom:4.0,
                      child:(Consumer<CartItemCounter>
                      (builder: (context,counter, _)
                      {
                        return Text(
                          counter.count.toString(),
                          style: TextStyle(color:Colors.white, fontSize: 12.0, fontWeight:FontWeight.w500),

                        );

                      }
                      )
                    )
                  )],
                ),
              )
            ]),
          ]
          ),
          drawer:MyDrawer(),


    body: SingleChildScrollView(
          child: Column(
        children: [
          Card(
           elevation: 5,
           child: Padding(
             padding: EdgeInsets.all(7),
             child: Stack(children: <Widget>[
               Align(
                 alignment: Alignment.centerRight,
                 child: Stack(
                   children: <Widget>[
                     Padding(
                         padding: const EdgeInsets.only(left: 10, top: 5),
                         child: Column(
                           children: <Widget>[
                             Row(children: [
                               
                               Column(children: [
                                

                                 ],),
                               
                                
                                ],),
                            
                                  Row(children: [
                                   Column(children: [
                                    
                                  Image.network("https://cdn4.vectorstock.com/i/1000x1000/72/13/cleaning-service-icon-vector-9417213.jpg",height: 100,width: 100,),
                                  
                                  SizedBox(
                                   height: 10,
                                   width: 20,
                                 ),

                                 ],),
                                Column(mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [Row(children: [
                                    Align(
                                  alignment: Alignment.centerLeft,
                                  child:  Text(record.name,textAlign: TextAlign.right,)),
               
                                 ]),
                                  Row(children: [
                                    
                                  Text(record.email,textAlign: TextAlign.right,),]),
                                  Row(children: [
                                    Align(
                                  alignment: Alignment.centerLeft,
                                  child:  Text(record.phoneNo,textAlign: TextAlign.right,)),
               
                                 ]),
                                  
          //                         Row(children: [
          //                          Icon(Icons.lock_clock),
          //                        Text(record.hour,style: TextStyle(
          // color: Colors.green),textAlign: TextAlign.left,),
          // Column(crossAxisAlignment: CrossAxisAlignment.center,
          
          //                          children: [
          //                        //cryptoIcon(),
          //                       //  SizedBox(
          //                       //    height: 10,
          //                       Row(children: [
          //                         Text("            ",textAlign: TextAlign.right,),
          

          //                       ],)
                                 


          //                        ],),])
                                ],
                                

                                   

                                 ),
                                 ],),
                                 
                                 
                               
                           ],
                         ))
                   ],
                 ),
               )
             ]),
           ),
   ),

SizedBox(height:30),
      Container(
  
        child: Column(
  
          children: <Widget>[
            Text("Fill the below Form"),
  
           // _myAppBar(),
  
            Container(
  
              width: MediaQuery.of(context).size.width,
  
              height: MediaQuery.of(context).size.height - 100,
  
              child: ListView(
  
                children: <Widget>[
  
                  Padding(
  
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
  
                    child: TextField(
  
                      decoration: InputDecoration(labelText: "Name: "),
  
                     
  
                      onChanged: (String name){
  
                         getTaskName(name);   
  
                      },
  
                      
  
                    ),
  
                  ),
  
                  Padding(
  
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
  
                    child: TextField(
  
                      //controller: _taskDetailsController,
  
                      decoration: InputDecoration(labelText: "Email-id: "),
  
                      onChanged: (String email){
  
                         getTaskEmail(email);   
  
                      },
  
                    ),
  
                  ),
  
                  Padding(
  
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
  
                    child: TextField(
  
                      decoration: InputDecoration(labelText: "Address: "),
  
                     
  
                     // controller: _taskNameController,
  
                      onChanged: (String add){
  
                         getTaskAdd(add);   
  
                      },
  
                      
  
                    ),
  
                  ),
  
                                Padding(
  
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
  
                    child: TextField(
  
                     // controller: _taskDateController,
  
                      decoration: InputDecoration(labelText: "Date: ",hintText: ("DD/MM/YYYY"),),
  
                      onChanged: (String taskdate){
  
                         getTaskDate(startDate);   
  
                      },
  
                    ),
  
                  ),
  
                  
                  // SizedBox(
  
                  //   height: 5.0,
  
                  // ),
                  Padding(
  
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
  
                   child: RaisedButton(
  
                          color: Colors.blue,
  
                           onPressed: () {
  
                             //Navigator.of(context).pop();
  Route route = MaterialPageRoute(builder: (context) => DateTimePicker());
  
                    Navigator.pushReplacement(context, route);
                           },
  
                           child: const Text(
  
                             " SelectTime",
                             style: TextStyle(color: Colors.black),
  
                           )),
                  ),
                
                  // margin: EdgeInsets.symmetric(horizontal: screenWidth > 600 ? screenWidth * 0.2 : 16),
                  // padding: const EdgeInsets.all(16.0),
                  // decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     // ignore: prefer_const_literals_to_create_immutables
                  //     boxShadow: [
                  //       const BoxShadow(
                  //         color: Colors.grey,
                  //         offset: Offset(0.0, 1.0), //(x,y)
                  //         blurRadius: 6.0,
                  //       ),
                  //     ],
                  //     borderRadius: BorderRadius.circular(16.0)),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        
                        margin: EdgeInsets.only(left: screenWidth * 0.025),
                        child: Row(
                          children: [
                            Column(
                              
                              children: [
                               
                                   Text("Hrs : Min : AM/PM"),
                                   Row(children: [
                                     PinEntryTextField(
                                      fields: 2,
                                     
                                    ),
                                    SizedBox(
                            height: screenHeight * 0.04,
                      
                   ),
                                  Text(":"),
                                  SizedBox(
                            height: screenHeight * 0.04,
                      
                   ),
                                   PinEntryTextField(
                                      fields: 2,
                                     
                                    ),
                                  
                                  
                                   ],)          
                        ],
                            ),
                          ],
                        ),
                        
                        
                        //child:Text(":"),
                      ),
                      SizedBox(
                        height: screenHeight * 0.04,
                      
                   )]),
                  
  
                  
                  Row(
  
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  
                    children: <Widget>[
  
                      RaisedButton(
  
                          color: Colors.blue,
  
                           onPressed: () {
  
                             Navigator.of(context).pop();
  //  Route route = MaterialPageRoute(builder: (context) => DateTimePicker());
  
  //                   Navigator.pushReplacement(context, route);
                           },
  
                           child: const Text(
  
                             "Cancel",
                             style: TextStyle(color: Colors.black),
  
                           )),
                         RaisedButton(
  
                          color: Colors.blue,
  
                          onPressed: () {
  createData();
                           // Navigator.of(context).pop();
  //Route route = MaterialPageRoute(builder: (context) => DateTimePicker());
  
                    //Navigator.pushReplacement(context, route);

                    Route route = MaterialPageRoute(builder: (context) => MySMSe(record,context));
  
                    Navigator.pushReplacement(context, route);
                          },
  
                          child: const Text(
  
                            "Next",
  
                            style: TextStyle(color: Colors.black),
  
                          )),
  
  
  
                      // This button results in adding the contact to the database
  
                    //   RaisedButton(
  
                    //       color: Colors.blue,
  
                    //       onPressed: () {
  
                    //         createData();
  
                    //         Route route = MaterialPageRoute(builder: (context) => AlertUser());
  
                    // Navigator.pushReplacement(context, route);
  
                    //       },
  
                    //       child: const Text(
  
                    //         "Submit",
  
                    //         style: TextStyle(color: Colors.black),
  
                    //       ))
  
                    ],
  
                  )
  
                ],
  
              ),
  
            )
  
          ],
  
        ),
  
      ),


        ],

      ),
    ),


    );

   
  }


  createData(){
    User user = FirebaseAuth.instance.currentUser;
    CollectionReference ds=FirebaseFirestore.instance.collection('book').doc(user.uid).collection('user_booking');
    // await FirebaseFirestore
    // .instance
    // .collection('orders')
    // .doc(user.uid)
    // .collection(
    //     "user_orders")
    // .add({
    //     //add your data that you want to upload
    //     });
    
    Map<String,dynamic> custinfo = {
      "name":name,
       "email":email,
       "add":add,
        "startDate":startDate,
         //"adharcard":adharcard,
          // "hours":hours,
          //  "url":url,

           //String name,email,startDate,time,adharcard,hours;

    };

    ds.add(custinfo).whenComplete((){
      print("information updated");
    });

  }
}