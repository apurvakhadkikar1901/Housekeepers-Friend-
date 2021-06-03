

import 'dart:io';


import 'package:checklist/Vendors/technician/on_click_profile_t.dart';
import 'package:checklist/Vendors/technician/technicianfom.dart';
import 'package:checklist/Vendors/electrician/my_order_e.dart';
import 'package:checklist/Vendors/electrician/on_click_profile_e.dart';

import 'package:checklist/Widgets/MyDrawerVendor.dart';
import 'package:checklist/Widgets/MyDrawerVendorT.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
File _image;
class ProfileT extends StatefulWidget {

// Record1 record;
//   BuildContext context;
//   Profile(this.record, this.context);




  String imageURL;
  
  final picker = ImagePicker();
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileT> {


  
  @override
  User user = FirebaseAuth.instance.currentUser;
   
    DocumentReference ds=FirebaseFirestore.instance.collection('technician').doc();
  Widget build(BuildContext context) {

    
     //User user = FirebaseAuth.instance.currentUser;
    return Scaffold(
appBar: AppBar(
        title: new Text("List of Technician", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Open Sans', fontWeight: FontWeight.bold)),
        // leading: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Image.asset(
        //     "images/houselogo.PNG",
        //     scale: 10.0,
        //   )
        // )
      ),
       drawer:MyDrawerVendorTechnician(),
        body: Center(
          child: Container(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            new Flexible(
                  child: _buildBody(context),
              ),
              // new Flexible(
              //     child: _buildBody1(context),
              // ),
                //_buildBody1(context),
             
              ],
              ),
              
            
        ),
          ),
      );


      
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









Widget _buildBody(BuildContext context) {
   
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("technician").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.docs);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    
    return ListView(
        padding: const EdgeInsets.only(top: 20.0),
        children: snapshot.map((data) => _buildListItem(context, data)).toList()
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Recordt.fromSnapshot(data);
    //final record2 = Record2.fromSnapshot(data);

    return  GestureDetector(
       onTap: (){
              Navigator.push(
    context,
    MaterialPageRoute(
    	builder: (context) => ProfilePT(record,context)),
  );},
   //padding: EdgeInsets.fromLTRB(10,10,10,0),
   //height: 180,
   //width: double.maxFinite,
     
   child: Card(
     
     elevation: 5,
     child: Padding(
       padding: EdgeInsets.all(5),
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
                               //Text("  "),
                             //cryptoIcon(),Image of food
                           
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
                            child:  Text(record.add,textAlign: TextAlign.right,)),
         
                           ]),
                            
                            Row(children: [
                              Padding(
                              padding: const EdgeInsets.only(left: 0),),

                             Icon(Icons.lock_clock),
                           Text(record.hour,style: TextStyle(
    color: Colors.green),textAlign: TextAlign.left,),

   

    Column(crossAxisAlignment: CrossAxisAlignment.center,
    
                             children: [
                           //cryptoIcon(),
                          //  SizedBox(
                          //    height: 10,
                          Row(children: [
                            Text("            ",textAlign: TextAlign.right,),
    
                          ],),
                          
                          
                           


                           ],),]),
                           
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
   );
    
  }





}


