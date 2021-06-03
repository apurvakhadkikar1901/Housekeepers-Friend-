//import 'dart:html';

//import 'package:checklist/Vendors/feedback_fetch_list.dart';
//import 'package:checklist/Vendors/maidhome.dart';
import 'package:checklist/Vendors/plumberhome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'feedback_fetch_list_p.dart';

class FeedbackP1 extends StatefulWidget {
  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<FeedbackP1> {
final _formKey = GlobalKey<FormState>();

  String feedbackp;

  getTaskFeedbackP(feedbackp){
    this.feedbackp=feedbackp;
  }
  createData(){
    DocumentReference ds=FirebaseFirestore.instance.collection('FeedbackP').doc();
    Map<String,dynamic> maidinfo = {
      "feedbackp":feedbackp,

           //String name,email,startDate,time,adharcard,hours;

    };

    ds.set(maidinfo).whenComplete((){
      print("information updated");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue[600],
          title: Text("Feedback"),
          centerTitle: true,),

          body: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                                              child: Column(
              children: <Widget>[
                Image.asset('images/feedback.PNG',
                                  height: 250.0, width: 250.0),
                 Padding(padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Text("Give your valuable feedback about the service"),
                  ),
                  SizedBox(height:40),
                Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: TextFormField(
                         onChanged: (String feedbackp){
                         getTaskFeedbackP(feedbackp);
                    },
                     // controller: _taskNameController,
                     
                        decoration: InputDecoration(labelText: "Write your feedback : "),


                        validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Text is empty';
                }
                return null;
              },
                    ),
                  ),
                  ElevatedButton(child:Text('Submit'),onPressed: (){
                    if (_formKey.currentState.validate()){
                    createData();
      Navigator.push(context, MaterialPageRoute(builder: (context)=>StoreHomesp()));
                   } }, ),
     ElevatedButton(child:Text('View Feedback'),onPressed: (){
                   // createData();
      Navigator.push(context, MaterialPageRoute(builder: (context)=>FeedFetchP()));
    }, ),
                 
              ]),
                      ),
          ),
    );
  
  }
}

class FeedbackNewP {
  final String feedbackp;
  

  // final String adharcard;

  final DocumentReference reference;

  FeedbackNewP.fromMap(Map<String, dynamic> map, {this.reference})
      :
        feedbackp = map['feedbackp'];
        
        
        //email = map['email'];

  FeedbackNewP.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "PlumberRecord<$feedbackp>";
}  

