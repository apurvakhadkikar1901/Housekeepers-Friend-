//import 'dart:html';

//import 'package:checklist/Admin/uploadItems.dart';
import 'package:checklist/Counters/cartitemcounter.dart';
import 'package:checklist/Store/storehome.dart';

import 'package:checklist/Vendors/technician/feedback_form_tech.dart';
//import 'package:checklist/Vendors/maidForm.dart';
import 'package:checklist/Vendors/main1.dart';
import 'package:checklist/Vendors/technician/PhoneFeche_tech.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
// import 'package:e_shop/Config/config.dart';
import "package:checklist/Widgets/loadingWidget.dart";
import "package:checklist/Widgets/myDrawer.dart";
import "package:checklist/Widgets/searchBox.dart";
import 'package:checklist/Vendors/cbook.dart';
double width;

class FeedFetcht extends StatefulWidget {
  @override
  _StoreHomesState createState() => _StoreHomesState();
}

class _StoreHomesState extends State<FeedFetcht> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        
          backgroundColor: Colors.blue[600],
          title: Text("Feedbacks"),
          centerTitle: true,

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
          drawer:MyDrawer(),
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
   
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("feedbackt").snapshots(),
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
    final record = FeedbackNew.fromSnapshot(data);
    
   return Container(
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
                            cryptoIcon(),
                            //  SizedBox(
                            //    height: 10,
                            //  ),

                             ],),
                                                        ],),
                        
                              Row(children: [
                               Column(children: [
                                
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
                              child:  Text(record.feedback,textAlign: TextAlign.right,)),
           
                             ]),
                             
                              
                              Row(children: [
                                Padding(
                                padding: const EdgeInsets.only(left: 0),),

      Column(crossAxisAlignment: CrossAxisAlignment.center,
      
                               children: [
                             //cryptoIcon(),
                            //  SizedBox(
                            //    height: 10,
                            Row(children: [
                              Text("            ",textAlign: TextAlign.right,),
                        

                            ],)
                             


                             ],),])
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



Widget card({Color primaryColor = Colors.black, String imgPath}) {
  return Container();
}

void checkItemInCart(String productID, BuildContext context) {}