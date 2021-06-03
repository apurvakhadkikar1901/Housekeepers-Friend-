//import 'dart:html';


import 'electricianhome.dart';
import 'package:checklist/Vendors/feedback_fetch_list.dart';

import 'feedback_fetch_liste.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Feedback1e extends StatefulWidget {
  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback1e> {
  final _formKey = GlobalKey<FormState>();

  String feedback;

  getTaskFeedback(feedback){
    this.feedback=feedback;
  }
  createData(){
    DocumentReference ds=FirebaseFirestore.instance.collection('feedbacke').doc();
    Map<String,dynamic> maidinfo = {
      "feedback":feedback,

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
                         onChanged: (String feedback){
                         getTaskFeedback(feedback);
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
      Navigator.push(context, MaterialPageRoute(builder: (context)=>electricianh()));
                   } }, ),
     ElevatedButton(child:Text('View Feedback'),onPressed: (){
                   // createData();
      Navigator.push(context, MaterialPageRoute(builder: (context)=>FeedFetche()));
    }, ),
                 
              ]),
                      ),
          ),
    );
  
  }
}

class FeedbackNewe {
  final String feedback;
  

  // final String adharcard;

  final DocumentReference reference;

  FeedbackNewe.fromMap(Map<String, dynamic> map, {this.reference})
      :
        feedback = map['feedback'];
        
        
        //email = map['email'];

  FeedbackNewe.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Record<$feedback>";
}  

