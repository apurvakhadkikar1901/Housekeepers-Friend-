// import 'package:checklist/Admin/uploadItems.dart';
// import 'package:checklist/Vendors/cbook.dart';
import 'package:checklist/Vendors/maidForm.dart';
import 'package:checklist/Vendors/maidhome.dart';
import 'package:checklist/Vendors/phone_fetch.dart';
// import 'package:checklist/Vendors/phone_sms_call.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
void main() {  
  runApp(new MaterialApp(home: new AlertUser()));  
}  
  
class AlertUser extends StatelessWidget {  

 Record1 record;
  BuildContext context;
  //This widget is the root of your application.  
  @override  
  Widget build(BuildContext context) {  
    // TODO: implement build  
    return new Scaffold(  
      appBar: AppBar(  
        title: Text("Confirmation page"),  
      ),  
      body: Center(  
        child: Column(  
        
          mainAxisAlignment: MainAxisAlignment.center,  
          children: <Widget>[  
            new Image.asset('images/housekeep.PNG',
                              height: 250.0, width: 250.0),
            new RaisedButton(  
              onPressed: () async {  
                final ConfirmAction action = await _asyncConfirmDialog(context);  
                print("Confirm Action $action" );  
              },  
              child: const Text(  
                "Confirm your Booking",  
                style: TextStyle(fontSize: 20.0),),  
                padding: EdgeInsets.fromLTRB(30.0,10.0,30.0,10.0),  
                shape: RoundedRectangleBorder(  
                  borderRadius: BorderRadius.circular(8.0)  
                ),  
                color: Colors.green,  
              ),
                
          ],  
        ),  
      ),  
    );  
  }  
}  
enum ConfirmAction { Cancel, Accept}  
Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {  
  return showDialog<ConfirmAction>(  
    context: context,  
    barrierDismissible: false, // user must tap button for close dialog!  
    builder: (BuildContext context) {  
      return AlertDialog(  
        title: Text('Confirm Service booking?'),  
        content: const Text(  
            'This will confirm your service booking'),  
        actions: <Widget>[  
          FlatButton(  
            child: const Text('Yes'),  
            onPressed: () {  
              //return _buildListItem(context,data),
              //Navigator.of(context).pop(ConfirmAction.Accept);  
             Record1 record;
                            Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PhoneFetch(record, context)),
                                  //print(record)
                    
                    
                    );
                    
            },  
          ),  
          FlatButton(  
            child: const Text('No'),  
            onPressed: () {  
              //Navigator.of(context).pop(ConfirmAction.Cancel);  
               Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StoreHomes()),
                    );
            },  
          )  
        ],  
      );  
    },  
  );




// Widget _buildBody(BuildContext context) {
   
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection("maid").snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) return LinearProgressIndicator();

//         //return _buildList(context, snapshot.data.docs);
//       },
//     );
//   }
//   Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    
//     return ListView(
//         padding: const EdgeInsets.only(top: 20.0),
//         //children: snapshot.map((data) => _buildListItem(context, data)).toList()
//     );
//   }
  

//   Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
//     final record = Record1.fromSnapshot(data);
//     //final record2 = Record2.fromSnapshot(data);

//     return  GestureDetector(
//    //padding: EdgeInsets.fromLTRB(10,10,10,0),
//    //height: 180,
//    //width: double.maxFinite,
//      onTap: (){
//               Navigator.push(
//     context,
//     MaterialPageRoute(
//     	builder: (context) => PhoneFetch(record,context)),
//   );
//             },
//    child: Card(
     
//      elevation: 5,
//      child: Padding(
//        padding: EdgeInsets.all(7),
//        child: Stack(children: <Widget>[
//          Align(
//            alignment: Alignment.centerRight,
//            child: Stack(
//              children: <Widget>[
//                Padding(
//                    padding: const EdgeInsets.only(left: 10, top: 5),
//                    child: Column(
//                      children: <Widget>[
//                        Row(children: [
                         
//                          Column(children: [
//                           //Text('Apurva'),
//                          // cryptoIcon(),
//                           //  SizedBox(
//                           //    height: 10,
//                           //  ),

//                            ],),
//                           //  Column(
//                           //    crossAxisAlignment: CrossAxisAlignment.end,
//                           //    children: [
//                           //      Row(children: [
//                           //        cryptoIcon1(),
//                           //  Text("1"),
//                           //  cryptoIcon2(),
//                           // //  SizedBox(
//                           // //    height: 10,
//                           // //  ),


//                           //      ],)
                           
//                           //  ],),
//                           ],),
                      
//                             Row(children: [
//                              Column(children: [
//                                //Text("  "),
//                              //cryptoIcon(),Image of food
                           
//                             Image.network("https://cdn4.vectorstock.com/i/1000x1000/72/13/cleaning-service-icon-vector-9417213.jpg",height: 100,width: 100,),
                            
//                             SizedBox(
//                              height: 10,
//                              width: 20,
//                            ),

//                            ],),
//                           Column(mainAxisAlignment: MainAxisAlignment.end,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [Row(children: [
//                               Align(
//                             alignment: Alignment.centerLeft,
//                             child:  Text(record.name,textAlign: TextAlign.right,)),
         
//                            ]),
//                             Row(children: [
                              
//                             Text(record.email,textAlign: TextAlign.right,),]),
//                             Row(children: [
//                               Align(
//                             alignment: Alignment.centerLeft,
//                             child:  Text(record.add,textAlign: TextAlign.right,)),
         
//                            ]),
                            
//                             Row(children: [
//                              Icon(Icons.lock_clock),
//                            Text(record.hour,style: TextStyle(
//     color: Colors.green),textAlign: TextAlign.left,),

//     ElevatedButton(child:Text('Book'),onPressed: (){
//       Navigator.push(context, MaterialPageRoute(builder: (context)=>cbook()));
//     }, ),
//     Column(crossAxisAlignment: CrossAxisAlignment.center,
    
//                              children: [
//                            //cryptoIcon(),
//                           //  SizedBox(
//                           //    height: 10,
//                           Row(children: [
//                             Text("            ",textAlign: TextAlign.right,),
//     //                       SmoothStarRating(
//     //       allowHalfRating: false,
//     //       onRated: (v) {
//     //        },
//     //       starCount: 5,
//     //       rating: 3,
//     //       size: 15.0,
//     //       isReadOnly:true,
//     //       filledIconData: Icons.star,
//     //       halfFilledIconData: Icons.star_border_outlined,
//     //       color: Colors.green,
//     //       borderColor: Colors.green,
//     //       spacing:0.0
//     // )

//                           ],)
                           


//                            ],),])
//                           ],
                          

                             

//                            ),
//                            ],),
                           
                           
//                           //  cryptoNameSymbol(),
//                           //  Spacer(),
//                           //  cryptoChange(),
//                           //  SizedBox(
//                           //    width: 10,
//                           //  ),
//                           //  changeIcon(),
//                           //  SizedBox(
//                           //    width: 20,
//                           //  )
                        
//                       //  Row(
//                       //    children: <Widget>[cryptoAmount()],
//                       //  )
//                      ],
//                    ))
//              ],
//            ),
//          )
//        ]),
//      ),
//    ),
//    );
//     //Padding(
//     //     key: ValueKey(record.name),
//     //     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//     //     child: Container(
//     //       decoration: BoxDecoration(
//     //         border: Border.all(color: Colors.grey),
//     //         borderRadius: BorderRadius.circular(5.0),
//     //       ),
//     //       child: ListTile(
//     //         title: Column(
//     //           children: <Widget>[
//     //             Padding(
//     //               padding: const EdgeInsets.all(10.0),
//     //               child: Text(
//     //                 record.name,
//     //                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//     //               ),
//     //             ),
//     //             Text(record.email)
//     //              //Image.network(record2.url),
//     //           ],
//     //         ),
//     //       ),
//     //     ),
//     //   );
//   }
 


  
    
}  