
import 'package:checklist/Counters/cartitemcounter.dart';
import 'package:checklist/Store/storehome.dart';
import 'package:checklist/Vendors/alert_user.dart';
import 'package:checklist/Vendors/date-time_picker.dart';
import 'package:checklist/Vendors/maidForm.dart';
import 'package:checklist/Vendors/phone_sms_call_p.dart';
import 'package:checklist/Vendors/plumberform.dart';
//import 'package:checklist/Vendors/maidhome.dart';
import 'package:checklist/Widgets/myDrawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'dart:math';
import 'package:intl/intl.dart';
import 'phone_sms_call.dart';

class PhoneFetchP extends StatefulWidget {
  PlumberRecord precord;
  BuildContext context;


  PhoneFetchP(this.precord, this.context);

  @override
  _PhoneFetchPState createState() => _PhoneFetchPState();
}

class _PhoneFetchPState extends State<PhoneFetchP> {
  final _formKey = GlobalKey<FormState>();

   TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime _selectedDate;
  
  void _pickDateDialog() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            //which date will display when user open the picker
            firstDate: DateTime(1950),
            //what will be the previous supported year in picker
            lastDate: DateTime
                .now()) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        //for rebuilding the ui
        _selectedDate = pickedDate;
      });
    });
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  File file;

  String imageURL;

  String name,email,startDate,time,adharcard,hours,add,url,phoneNo;

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
  getTaskPhone(phoneNo){
    this.phoneNo=phoneNo;
  }

  getTaskDate(startDate){
    this.startDate=startDate;
  }

  getTaskTime(time){
    this.time=time;
  }

  getTaskhour(hours){
    this.hours=hours;
  }

  int _myTaskType = 0;

  String taskVal;

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
                                    
                                  Image.network("https://media.istockphoto.com/vectors/plumbing-repair-banner-vector-id1193516262?k=6&m=1193516262&s=612x612&w=0&h=h7-QKZBrpphZpWUdCEK5AH-88oOGH5UBlOdnwXkeiZ0=",height: 100,width: 100,),
                                  
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
                                  child:  Text(widget.precord.name,textAlign: TextAlign.right,)),
               
                                 ]),
                                  Row(children: [
                                    
                                  Text(widget.precord.email,textAlign: TextAlign.right,),]),
                                  Row(children: [
                                    Align(
                                  alignment: Alignment.centerLeft,
                                  child:  Text(widget.precord.phoneNo,textAlign: TextAlign.right,)),
               
                                 ]),
                                  
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
  
        child: Form(
          key: _formKey,
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
  
                      child: TextFormField(
  
                        decoration: InputDecoration(labelText: "Name: "),
  validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Text is empty';
                }
                return null;
              },
                       
  
                        onChanged: (String name){
  
                           getTaskName(name);   
  
                        },
  
                        
  
                      ),
  
                    ),
  
                    Padding(
  
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
  
                      child: TextFormField(
  
                        //controller: _taskDetailsController,
  
                        decoration: InputDecoration(labelText: "Email-id: "),
  validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Text is empty';
                }
                return null;
              },
                        onChanged: (String email){
  
                           getTaskEmail(email);   
  
                        },
  
                      ),
  
                    ),
  
                    Padding(
  
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
  
                      child: TextFormField(
  
                        decoration: InputDecoration(labelText: "Address: "),
  validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Text is empty';
                }
                return null;
              },
                       
  
                       // controller: _taskNameController,
  
                        onChanged: (String add){
  
                           getTaskAdd(add);   
  
                        },
  
                        
  
                      ),
  
                    ),

                     Padding(
  
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
  
                      child: TextFormField(
  
                        decoration: InputDecoration(labelText: "Phone Number: "),
  validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Text is empty';
                }
                return null;
              },
                       
  
                       // controller: _taskNameController,
  
                        onChanged: (String phoneNo){
  
                           getTaskPhone(phoneNo);   
  
                        },
  
                        
  
                      ),
  
                    ),



                     RaisedButton(child: Text('Add Date'), onPressed: _pickDateDialog),
          SizedBox(height: 20),
          Text(_selectedDate == null //ternary expression to check if date is null
              ? 'No date was chosen!'
              : 'Picked Date: ${DateFormat.yMMMd().format(_selectedDate)}'),
                //RaisedButton(child: Text('Add Time'), onPressed: _selectTime),
                  RaisedButton(
                onPressed :() => _selectTime(context),
                              child: Text('SELECT TIME'),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Selected time: ${_time.format(context)}',
                            ),
  
                 
  
                    
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

                              if (_formKey.currentState.validate()){
  createData();
                             // Navigator.of(context).pop();
  //Route route = MaterialPageRoute(builder: (context) => DateTimePicker());
  
                      //Navigator.pushReplacement(context, route);

                      Route route = MaterialPageRoute(builder: (context) => MySMSP(widget.precord,context));
  
                      Navigator.pushReplacement(context, route);
                             } },
  
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
  
      ),


        ],

      ),
    ),


    );

   
  }

  createData(){
    User user = FirebaseAuth.instance.currentUser;
    CollectionReference ds=FirebaseFirestore.instance.collection('plumberUser');
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
       "phoneNo":phoneNo,
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




  _selectTime(BuildContext context) async {

 final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }


                }

}



class UserRecord1 {
  final String name;
  final String email;
  //final String hour;
  final String add;
final String phoneNo;
  // final String adharcard;

  final DocumentReference reference;

  UserRecord1.fromMap(Map<String, dynamic> map, {this.reference})
      :
        name = map['name'],
        email = map['email'],
       // hour = map['hours'],
        add = map['add'],
phoneNo = map['phoneNo'];
        
        //email = map['email'];

  UserRecord1.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "UserRecord1<$name:$email:$add:$phoneNo>";
}  

