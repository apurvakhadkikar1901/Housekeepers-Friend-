


import 'package:checklist/Vendors/maidForm.dart';
import 'package:checklist/Vendors/plumberform.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main(){

  //runApp(MySMS());

}

class MySMSP extends StatelessWidget {
  @override
  PlumberRecord precord;
  BuildContext context;
  MySMSP(this.precord, this.context);
  //List<String> recipents = [record.phoneNo];
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(precord,context),
    );
  }
}
// Record1 record1;
// BuildContext context;

//List<String> recipents = [record.phoneNo];
class Home extends StatelessWidget {
  PlumberRecord precord;
  BuildContext context;
  Home(this.precord, this.context);
  //var phone = record.phoneNo;
 //User user = FirebaseAuth.instance.currentUser;
 
User user = FirebaseAuth.instance.currentUser;
    DocumentReference ds=FirebaseFirestore.instance.collection('vendors').doc();
    //.get().then((DocumentSnapshot ds) {  ds[v_name]     });;
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(title: Text("Send sms to Housekeeper"
      
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
                    _sendSMS("About Confirmation booking Name : "+(snapshot.data.docs[0]['name'])+"\nEmail ID :"+(snapshot.data.docs[0]['email'])+"\nAddress :"+(snapshot.data.docs[0]['email'])+"\nAddress :"+(snapshot.data.docs[0]['add'])+"\nDate :"+"\nTime :"+"\nWaiting for the booking confirmation",[precord.phoneNo]);
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
