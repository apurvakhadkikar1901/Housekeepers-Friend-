


import 'package:checklist/Vendors/maidForm.dart';
import 'package:checklist/Vendors/phone_fetch_p.dart';
import 'package:checklist/Vendors/plumberform.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main(){

  //runApp(MySMS());

}

class MyOrderPhoneSms extends StatelessWidget {
  @override
  UserRecord1 record;
  BuildContext context;
  MyOrderPhoneSms(this.record, this.context);
  //List<String> recipents = [record.phoneNo];
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(record,context),
    );
  }
}
// Record1 record1;
// BuildContext context;

//List<String> recipents = [record.phoneNo];
class Home extends StatelessWidget {
  UserRecord1 record;
  BuildContext context;
  Home(this.record, this.context);
  //var phone = record.phoneNo;
 //User user = FirebaseAuth.instance.currentUser;
 
User user = FirebaseAuth.instance.currentUser;
    DocumentReference ds=FirebaseFirestore.instance.collection('plumberUser').doc();
    //.get().then((DocumentSnapshot ds) {  ds[v_name]     });;
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(title: Text("Send sms to Customer"
      
      ),
backgroundColor: Colors.blue[600],
          //title: Text("Feedback"),
          centerTitle: true,

      ),
      
     body:StreamBuilder(stream: FirebaseFirestore.instance.collection('plumberUser').snapshots(),
      builder:(context,snapshot){
        if(!snapshot.hasData) return Text('Loading data.....please wait'); 
      return Container(

        child: Center(

          //Image.asset('images/housekeep.PNG',
            //                  height: 250.0, width: 250.0),
          child: Column(
            
            children: [
              Padding(padding: const EdgeInsets.all(20)),
              Image.asset('images/send_feedback.PNG',
                              height: 250.0, width: 250.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text("Send Sms",
                      style: Theme.of(context).accentTextTheme.button),
                  onPressed: () {
                    _sendSMS("Your Booking is accepted and confirmed.",[record.phoneNo]);
                  },
                ),
              ),
            ],
          ),
        ),

  );
       } )
    );
  }



}

void _sendSMS(String message, List<String> recipents) async {
  String _result = await sendSMS(message: message, recipients: recipents)
      .catchError((onError) {
    print(onError);
  });
  print(_result);
}
