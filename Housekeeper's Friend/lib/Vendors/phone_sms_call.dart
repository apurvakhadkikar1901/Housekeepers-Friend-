// import 'package:flutter/material.dart';
// //import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';
//  void main() {
//    runApp(
//      new PhoneSms(),
//    );
//  }
//  class PhoneSms extends StatelessWidget {
//    @override
//    Widget build(BuildContext context) {
//      return new MaterialApp(
//        title: 'Flutter Demo',
//        home: new SMS(),
//      );
//    }
//  }
//  class SMS extends StatelessWidget {
//    SMS({Key key}) : super(key: key);
//    @override
//    Widget build(BuildContext context) =>
//        new Scaffold(
//          appBar: new AppBar(
//            title: new Text("Launchers"),
//          ),
//          body: new Center(
//            child: Padding(
//              padding: const EdgeInsets.all(20.0),
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//            //   Card(
//            //   color: Colors.white70,
//            //     shape: RoundedRectangleBorder(
//            //       side: new BorderSide(color: Colors.white, width: 2.0),
//            //       borderRadius: BorderRadius.circular(25.0),
//            //     ),
//            //     child: Column(
//            //         crossAxisAlignment: CrossAxisAlignment.stretch,
//            //         children: <Widget>[
//            //     Padding(
//            //     padding: const EdgeInsets.all(30.0),
//            //     child: FlatButton.icon(
//            //       icon: Icon(Icons.add_to_home_screen),
//           //       label: Text(
//            //         "Open Website",
//            //         style: TextStyle(fontSize: 25),
//            //       ),
//           //       onPressed: () => launch("http://google.com"),
//            //     )
//            //     ),
//            //     ],
//            //   ),
//            // ),
//           // SizedBox(height: 10.0),
//            Card(
//              shape: RoundedRectangleBorder(
//                side: new BorderSide(color: Colors.white, width: 2.0),
//                borderRadius: BorderRadius.circular(25.0),
//              ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                  Padding(
//                    padding: const EdgeInsets.all(30.0),
//                    child: FlatButton.icon(
//                       icon: Icon(Icons.call),
//                        label:Text(
//                           "Make a Call", style: TextStyle(fontSize: 25),
//                        ),
//                       onPressed: () => launch("tel://123"),
//                        ),
//                  ),
//               ],
//              ),
//            ),
//            SizedBox(height: 10.0),
//            // Card(
//            //   color: Colors.white70,
//            //   shape: RoundedRectangleBorder(
//            //     side: new BorderSide(color: Colors.white, width: 2.0),
//            //     borderRadius: BorderRadius.circular(25.0),
//            //   ),
//            //   child: Column(
//            //     crossAxisAlignment: CrossAxisAlignment.stretch,
//            //     children: <Widget>[
//            //       Padding(
//            //         padding: const EdgeInsets.all(30.0),
//            //         child: FlatButton.icon(
//            //             icon: Icon(Icons.email),
//            //             label:Text(
//            //                 "Send a Email", style: TextStyle(fontSize: 25)),
//            //             onPressed: () =>
//            //                 launch(
//            //                     "mailto:abhi@androidcoding.in?subject=Hi&body=How are you%20plugin"),
//            //             ),
//            //       ),
//          //     ],
//            //   ),
//            // ),
//           // SizedBox(height: 10.0),
//            Card(
//              shape: RoundedRectangleBorder(
//                side: new BorderSide(color: Colors.white, width: 2.0),
//                borderRadius: BorderRadius.circular(25.0),
//              ),
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.stretch,
//                children: <Widget>[
//                  Padding(
//                    padding: const EdgeInsets.all(30.0),
//                    child:  FlatButton.icon(
//                        icon: Icon(Icons.sms),
//                        label:Text(
//                           "Write a SMS", style: TextStyle(fontSize: 25)),
//                       onPressed: () => launch("sms:9604493999"),
//                      ),
//                 ),
//               ],
//             ),
//           ),
//           ],
//         ),
//       )

//   ,

//   )

//   ,

//   );
// }




import 'package:checklist/Vendors/maidForm.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main(){

  //runApp(MySMS());

}

class MySMS extends StatelessWidget {
  @override
  Record1 record;
  BuildContext context;
  MySMS(this.record, this.context);
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
  Record1 record;
  BuildContext context;
  Home(this.record, this.context);
  //var phone = record.phoneNo;
 //User user = FirebaseAuth.instance.currentUser;
 
User user = FirebaseAuth.instance.currentUser;
    DocumentReference ds=FirebaseFirestore.instance.collection('maidUser').doc();

    //.get().then((DocumentSnapshot ds) {  ds[v_name]     });;
  Widget build(BuildContext context) {
  

    return Scaffold(
      appBar: AppBar(title: Text("Send sms to Housekeeper"
      
      ),
backgroundColor: Colors.blue[600],
          //title: Text("Feedback"),
          centerTitle: true,

      ),
      body:StreamBuilder(stream: FirebaseFirestore.instance.collection('maidUser').snapshots(),
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
                    _sendSMS("About Confirmation booking Name : "+ (snapshot.data.docs[0]['name'])+"\nEmail ID :"+(snapshot.data.docs[0]['email'])+"\nAddress :"+(snapshot.data.docs[0]['add'])+"\nDate :"+"\nTime :"+"\nWaiting for the booking confirmation" ,[record.phoneNo]);
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
