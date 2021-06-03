

import 'dart:io';

import 'package:checklist/Vendors/feedback_fetch_list.dart';
import 'package:checklist/Vendors/feedback_fetch_list_p.dart';
import 'package:checklist/Vendors/maidForm.dart';
import 'package:checklist/Vendors/plumberform.dart';
import 'package:checklist/Widgets/MyDrawerVendor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

File _image;
class ProfilePP extends StatefulWidget {
PlumberRecord precord;
  BuildContext context;
  ProfilePP(this.precord, this.context);
// Record1 record;
//   BuildContext context;
//   Profile(this.record, this.context);




  String imageURL;
  
  final picker = ImagePicker();
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePP> {


  //  Record1 record;
  // BuildContext context;
  // _ProfileState(this.record, this.context);
  @override
  User user = FirebaseAuth.instance.currentUser;
   
    DocumentReference ds=FirebaseFirestore.instance.collection('plumber').doc();
  Widget build(BuildContext context) {

    
     //User user = FirebaseAuth.instance.currentUser;
    return Scaffold(
appBar: AppBar(
        title: new Text("Profile", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Open Sans', fontWeight: FontWeight.bold)),
        // leading: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Image.asset(
        //     "images/houselogo.PNG",
        //     scale: 10.0,
        //   )
        // )
      ),
       drawer:MyDrawerVendor(),
       
      body:StreamBuilder(stream: FirebaseFirestore.instance.collection('plumber').snapshots(),
      builder:(context,snapshot){
        if(!snapshot.hasData) return Text('Loading data.....please wait');
        
      return  Container(
          
           margin: EdgeInsets.all(40),
          height: double.infinity,
          width: double.infinity,
          child: Center(
            
            child:SingleChildScrollView(
                          child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
           Container(
              height: 150,
              width: 300,
                //child: Image.asset('images/profilePic.PNG')
              child: Column(children:[
        Material(borderRadius: BorderRadius.all(Radius.circular(80.0)),
        elevation: 8.0,
        child:Container(
          
          height: 140.0,
          width: 140.0,
          child:InkWell(
              
              onTap: getImage,
           // File _image;
 
                              child: CircleAvatar(
                 backgroundColor: Colors.blueAccent,
          //radius: radius,
          child: CircleAvatar(
               backgroundColor: Colors.black,
    radius: 40.0,
      //radius: radius - 5,
      child: CircleAvatar(
        radius: 38.0,
        child: ClipOval(
          child: (_image != null)
          ? Image.file(_image)
          : Image.asset('images/profilePic.PNG'),
        ),
        backgroundColor: Colors.white,
    ),
  ),
          ),
                //child: Image.asset('images/profilePic.PNG',),
                
                
                //backgroundImage: Image,
                  //backgroundImage: NetworkImage(EcommerceApp.sharedPreferences.getString(EcommerceApp.userAvatarUrl),
              ),
          ), // takeImage(context),
                )
        ,],)
              
              ),
              SizedBox(
              height: 15.0,
              ),
              Container(
              
                child:Text(
                  "Username",
                  textAlign: TextAlign.left,
                  style:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0,color: Colors.black,
                ),
              ),
              

                ),
                SizedBox(
              height: 5.0,
              ),

                Container(
                  child:Text(
                widget.precord.name,
                  textAlign: TextAlign.left,
                  style:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: 16.0,color: Colors.black,
                ),
              ),

                ),
                SizedBox(
                  height:25.0,
                ),
                
                Container(
                child:Text(
                  "Email",
                  style:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0,color: Colors.black,
                ),
              ),
                ),
                 SizedBox(
              height: 5.0,
              ),
                   Container(
                  child:Text(
                 widget.precord.email,
                  textAlign: TextAlign.left,
                  style:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: 16.0,color: Colors.black,
                ),
              ),

                ),
                 SizedBox(
                  height:25.0,
                ),
              Container(
                child:Text(
                  "Phone Number",
                  style:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0,color: Colors.black,
                ),
              ),

                ),
                 SizedBox(
              height: 5.0,
              ),
               
              
                
                Container(
                  child:Text(
                 widget.precord.phoneNo,
                  textAlign: TextAlign.left,
                  style:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: 16.0,color: Colors.black,
                ),
              ),

                ),
                SizedBox(
                  height:25.0,
                ),  
                 Container(
              
                child:Text(
                  "Address",
                  textAlign: TextAlign.left,
                  style:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0,color: Colors.black,
                ),
              ),
              

                ),
                SizedBox(
              height: 5.0,
              ),

                Container(
                  child:Text(
                  widget.precord.add,
                  textAlign: TextAlign.left,
                  style:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: 16.0,color: Colors.black,
                ),
              ),

                ),
              
                SizedBox(
                  height:25.0,
                ),
                    Container(
              
                child:Text(
                  "Working Hours",
                  textAlign: TextAlign.left,
                  style:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0,color: Colors.black,
                ),
              ),
              

                ),
                SizedBox(
              height: 5.0,
              ),

                Container(
                  child:Text(
                  widget.precord.hour,
                  textAlign: TextAlign.left,
                  style:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: 16.0,color: Colors.black,
                ),
              ),),
            
                 RaisedButton(
                          color: Colors.blue,
                          onPressed: () {
                           // createData();
                              Route route = MaterialPageRoute(builder: (context) => FeedFetchP());
                     Navigator.pushReplacement(context, route);},
                  child:Text(
                  'View Feedbacks',
                  textAlign: TextAlign.left,
                  style:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: 16.0,color: Colors.black,
                ),
              ),)
               
                          ]),
            )

            ),
        );
      
     } ));
  }
  takeImage(BuildContext context) {}

 Future getImage() async {
   final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
     // File _image;
      
      _image = File(pickedFile.path);
    });
  }



  
}


