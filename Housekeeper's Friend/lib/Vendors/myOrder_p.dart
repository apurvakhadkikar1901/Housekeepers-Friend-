//import 'dart:html';

//import 'package:checklist/Admin/uploadItems.dart';
import 'package:checklist/Counters/cartitemcounter.dart';
import 'package:checklist/Store/storehome.dart';

import 'package:checklist/Vendors/feedback_form.dart';
import 'package:checklist/Vendors/feedback_form_p.dart';

import 'package:checklist/Vendors/main1.dart';
import 'package:checklist/Vendors/myOrder_p_Ontap.dart';
import 'package:checklist/Vendors/phone_fetch.dart';
import 'package:checklist/Vendors/phone_fetch_p.dart';
import 'package:checklist/Vendors/plumberform.dart';
import 'package:checklist/Widgets/MyDrawerVendor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:e_shop/Store/cart.dart';
// import 'package:e_shop/Store/product_page.dart';
// import 'package:e_shop/Counters/cartitemcounter.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
// import 'package:e_shop/Config/config.dart';
import '../Widgets/loadingWidget.dart';
import '../Widgets/myDrawer.dart';
import '../Widgets/searchBox.dart';
//import 'package:checklist/Vendors/electricianfom.dart';
import 'package:checklist/Vendors/maidForm.dart';
// import '../Models/item.dart';
import 'addcartp.dart';
import 'cbook.dart';
double width;

class OrderHomesP extends StatefulWidget {
  @override
  _StoreHomesState createState() => _StoreHomesState();
}

class _StoreHomesState extends State<OrderHomesP> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          
          backgroundColor: Colors.blue[600],
          title: Text("My Orders"),
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
      ),


    );
  }

  
  

  
 Widget _buildBody(BuildContext context) {
   User user = FirebaseAuth.instance.currentUser;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("plumberUser").snapshots(),
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
    final userrecord = UserRecord1.fromSnapshot(data);
    //final record2 = Record2.fromSnapshot(data);

    return  GestureDetector(
   onTap: (){
              Navigator.push(
    context,
    MaterialPageRoute(
    	builder: (context) => myOrderOnTapP(userrecord,context)),
  );
            },
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
                          //Text('Apurva'),
                          //cryptoIcon(),
                          //  SizedBox(
                          //    height: 10,
                          //  ),

                           ],),
                          //  Column(
                          //    crossAxisAlignment: CrossAxisAlignment.end,
                          //    children: [
                          //      Row(children: [
                          //        cryptoIcon1(),
                          //  Text("1"),
                          //  cryptoIcon2(),
                          // //  SizedBox(
                          // //    height: 10,
                          // //  ),


                          //      ],)
                           
                          //  ],),
                          ],),
                      
                            Row(children: [
                             Column(children: [
                               
                               //Text("  "),
                             //cryptoIcon(),Image of food
                           
                            Image.network("https://static.vecteezy.com/system/resources/previews/001/993/889/non_2x/beautiful-latin-woman-avatar-character-icon-free-vector.jpg",height: 100,width: 100,),
                            
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
                            child:  Text(userrecord.name,textAlign: TextAlign.right,)),
         
                           ]),
                            Row(children: [
                              
                            Text(userrecord.email,textAlign: TextAlign.right,),]),
                            Row(children: [
                              Align(
                            alignment: Alignment.centerLeft,
                            child:  Text(userrecord.add,textAlign: TextAlign.right,)),
         
                           ]),
                            
                            Row(children: [
//                               Padding(
//                               padding: const EdgeInsets.only(left: 0),),
// //Padding(padding: const EdgeInsets.all(1)),
//                              Icon(Icons.lock_clock),
//                            Text(userrecord.hour,style: TextStyle(
//     color: Colors.green),textAlign: TextAlign.left,),
//width: MediaQuery.of(context).size.width,
  //            height: MediaQuery.of(context).size.height - 100,
    // ElevatedButton(child:Text('Feedback'),onPressed: (){
    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Feedback1()));
    // }, ),
    // ElevatedButton(child:Text('Send SMS'),onPressed: (){
    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneFetch(record,context)));
    // }, ),
    Column(crossAxisAlignment: CrossAxisAlignment.center,
    
                             children: [
                           //cryptoIcon(),
                          //  SizedBox(
                          //    height: 10,
                          Row(children: [
                            Text("            ",textAlign: TextAlign.right,),
    //                       SmoothStarRating(
    //       allowHalfRating: false,
    //       onRated: (v) {
    //        },
    //       starCount: 5,
    //       rating: 3,
    //       size: 15.0,
    //       isReadOnly:true,
    //       filledIconData: Icons.star,
    //       halfFilledIconData: Icons.star_border_outlined,
    //       color: Colors.green,
    //       borderColor: Colors.green,
    //       spacing:0.0
    // )

                          ],),
                          
                          
                           


                           ],),]),
    //                        Row(children: [
                              
    //                         ElevatedButton(child:Text('Feedback'),onPressed: (){
    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>FeedbackP1()));
    // }, ),
    // ElevatedButton(child:Text('Send SMS'),onPressed: (){
    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneFetchP(userrecord,context)));
    // }, ),
         
    //                        ]),
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
   Widget cryptoIcon() {
   return Padding(
     padding: const EdgeInsets.only(left: 15.0),
     child: Align(
         alignment: Alignment.centerLeft,
         child: Icon(
           Icons.favorite_border,
           color: Colors.black,
           size: 25,
         )),
   );
 }
  
  


}

// Widget sourceInfo(ItemModel model, BuildContext context,
//     {Color background, removeCartFunction}) {
//   return InkWell();
// }

Widget card({Color primaryColor = Colors.black, String imgPath}) {
  return Container();
}

void checkItemInCart(String productID, BuildContext context) {}