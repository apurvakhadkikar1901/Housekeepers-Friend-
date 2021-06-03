//import 'dart:html';

//import 'package:checklist/Admin/uploadItems.dart';
import 'package:checklist/Counters/cartitemcounter.dart';
import 'package:checklist/Store/storehome.dart';

import 'package:checklist/Vendors/technician/PhoneFeche_tech.dart';
import 'package:checklist/Vendors/technician/addcarttech.dart';

import 'package:checklist/Vendors/technician/technicianfom.dart';
import 'package:checklist/Vendors/technician/feedback_form_tech.dart';
import 'package:checklist/Vendors/main1.dart';
import 'package:checklist/Vendors/technician/PhoneFeche_tech.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:e_shop/Store/cart.dart';
// import 'package:e_shop/Store/product_page.dart';
// import 'package:e_shop/Counters/cartitemcounter.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
// import 'package:e_shop/Config/config.dart';
import "package:checklist/Widgets/loadingWidget.dart";
import "package:checklist/Widgets/myDrawer.dart";
import "package:checklist/Widgets/searchBox.dart";
//import 'package:checklist/Vendors/electricianfom.dart';
import 'package:checklist/Vendors/maidForm.dart';
// import '../Models/item.dart';
import 'package:checklist/Vendors/cbook.dart';
double width;

class technician extends StatefulWidget {
  @override
  _technicianState createState() => _technicianState();
}

class _technicianState extends State<technician> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          
          backgroundColor: Colors.blue[600],
          title: Text("Technician"),
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
  Widget _buildList1(BuildContext context, List<DocumentSnapshot> snapshot) {
    
    return ListView(
        padding: const EdgeInsets.only(top: 20.0),
        children: snapshot.map((data) => _buildListItem1(context, data)).toList()
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    //final recorde = Recorde.fromSnapshot(data);
    //final record2 = Record2.fromSnapshot(data);
    final recorde = Recordt.fromSnapshot(data);

    return  GestureDetector(
   //padding: EdgeInsets.fromLTRB(10,10,10,0),
   //height: 180,
   //width: double.maxFinite,
     onTap: (){
              Navigator.push(
    context,
    MaterialPageRoute(
    	builder: (context) => addtocardt(recorde,context)),
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
                          
                          cryptoIcon(),
                          //  SizedBox(
                          //    height: 10,
                          //  ),

                           ],),
                          
                           
                          //  ],),
                          ],),
                      
                            Row(children: [
                             Column(children: [
                               //Text("  "),
                             //cryptoIcon(),Image of food
                           
                            Image.network("https://mpng.subpng.com/20180408/pxq/kisspng-computer-icons-technician-technical-support-web-5aca239185d704.8266128515231968175482.jpg",height: 100,width: 100,),
                            
                            SizedBox(
                             height: 10,
                             width: 20,
                           ),

                           ],),
                           SizedBox(
                             
                             width: 5,
                           ),
                          Column(mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Row(children: [
                              Align(
                            alignment: Alignment.centerLeft,
                            child:  Text(recorde.name,textAlign: TextAlign.right,)),
         
                           ]),
                            Row(children: [
                              
                            Text(recorde.email,textAlign: TextAlign.right,),]),
                            Row(children: [
                              Align(
                            alignment: Alignment.centerLeft,
                            child:  Text(recorde.add,textAlign: TextAlign.right,)),
         
                           ]),
                            
                            Row(children: [
                              Padding(
                              padding: const EdgeInsets.only(left: 0),),
//Padding(padding: const EdgeInsets.all(1)),
                             Icon(Icons.lock_clock),
                           Text(recorde.hour,style: TextStyle(
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
                           Row(children: [
                              
                            ElevatedButton(child:Text('Feedback'),onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Feedback1t()));
    }, ),
     SizedBox(
                             
                             width: 10,
                           ),
    ElevatedButton(child:Text('Send SMS'),onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneFetche(recorde,context)));
    }, ),
         
                           ]),
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
  
  Widget _buildListItem1(BuildContext context, DocumentSnapshot data) {
    final record2 = Record2.fromSnapshot(data);
    return Padding(
        key: ValueKey(record2.location),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: ListTile(
            onTap: (){
              Navigator.push(
    context,
    MaterialPageRoute(
    	builder: (context) => MyAppp()),
  );
            },
            title: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    record2.location,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Image.network(record2.url),
              ],
            ),
          ),
        ),
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