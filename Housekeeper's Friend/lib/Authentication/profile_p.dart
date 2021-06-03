

import 'dart:io';

import 'package:checklist/Vendors/On_click_profile_p.dart';
import 'package:checklist/Vendors/maidForm.dart';
import 'package:checklist/Vendors/myOrder_p.dart';
import 'package:checklist/Vendors/plumberform.dart';
import 'package:checklist/Widgets/MyDrawerVendor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
File _image;
class ProfileP extends StatefulWidget {

// Record1 record;
//   BuildContext context;
//   Profile(this.record, this.context);




  String imageURL;
  
  final picker = ImagePicker();
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileP> {


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
        title: new Text("List of Plumbers", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Open Sans', fontWeight: FontWeight.bold)),
        // leading: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Image.asset(
        //     "images/houselogo.PNG",
        //     scale: 10.0,
        //   )
        // )
      ),
       drawer:MyDrawerVendor(),
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
      stream: FirebaseFirestore.instance.collection("plumber").snapshots(),
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
    final precord = PlumberRecord.fromSnapshot(data);
    //final record2 = Record2.fromSnapshot(data);

    return  GestureDetector(
       onTap: (){
              Navigator.push(
    context,
    MaterialPageRoute(
    	builder: (context) => ProfilePP(precord,context)),
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
                            child:  Text(precord.name,textAlign: TextAlign.right,)),
         
                           ]),
                            Row(children: [
                              
                            Text(precord.email,textAlign: TextAlign.right,),]),
                            Row(children: [
                              Align(
                            alignment: Alignment.centerLeft,
                            child:  Text(precord.add,textAlign: TextAlign.right,)),
         
                           ]),
                            
                            Row(children: [
                              Padding(
                              padding: const EdgeInsets.only(left: 0),),

                             Icon(Icons.lock_clock),
                           Text(precord.hour,style: TextStyle(
    color: Colors.green),textAlign: TextAlign.left,),

    //  ElevatedButton(child:Text('My Orders'),onPressed: (){
    //  Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderHomesP()));
    //  }, ),

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
                           
                           
                          //  cryptoNameSymbol(),
                          //  Spacer(),
                          //  cryptoChange(),
                          //  SizedBox(
                          //    width: 10,
                          //  ),
                          //  changeIcon(),
                          //  SizedBox(
                          //    width: 20,
                          //  )
                        
                      //  Row(
                      //    children: <Widget>[cryptoAmount()],
                      //  )
                     ],
                   ))
             ],
           ),
         )
       ]),
     ),
   ),
   );
    //Padding(
    //     key: ValueKey(record.name),
    //     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    //     child: Container(
    //       decoration: BoxDecoration(
    //         border: Border.all(color: Colors.grey),
    //         borderRadius: BorderRadius.circular(5.0),
    //       ),
    //       child: ListTile(
    //         title: Column(
    //           children: <Widget>[
    //             Padding(
    //               padding: const EdgeInsets.all(10.0),
    //               child: Text(
    //                 record.name,
    //                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    //               ),
    //             ),
    //             Text(record.email)
    //              //Image.network(record2.url),
    //           ],
    //         ),
    //       ),
    //     ),
    //   );
  }





}


// buildSearchResult() {
//     return FutureBuilder(
//         future: searchResultFuture,
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return circularProgress();
//           }
//           // otherwise if it has data
//           List<Text> searchResults = [];
//           snapshot.data.**documents**.forEach((doc) {
//             User user = User.fromDocument(doc);
//             searchResults.add(Text(user.username));
//           });
//           return ListView(
//             children: searchResults,
//           );
//         });
//   }