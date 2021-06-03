import 'package:checklist/Counters/cartitemcounter.dart';
import 'package:checklist/Store/storehome.dart';
import 'package:checklist/Vendors/maidForm.dart';
import 'package:checklist/Vendors/myOrderPhoneSms.dart';
import 'package:checklist/Vendors/phone_fetch_p.dart';
import 'package:checklist/Vendors/plumberform.dart';
import 'package:checklist/Widgets/MyDrawerVendor.dart';
//import 'package:checklist/Vendors/maidhome.dart';
import 'package:checklist/Widgets/myDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class myOrderOnTapP extends StatelessWidget {
  UserRecord1 urecord;
  BuildContext context;
  myOrderOnTapP(this.urecord, this.context);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          // flexibleSpace: Container(
          //   // decoration: BoxDecoration(
          //   //     gradient: new LinearGradient(
          //   //   colors: [Colors.blue, Colors.blue[100]],
          //   //   begin: const FractionalOffset(0.0, 0.0),
          //   //   end: const FractionalOffset(1.0, 0.0),
          //   //   stops: [0.0, 1.0],
          //   //   tileMode: TileMode.clamp,
          //   // )),
          // )
          backgroundColor: Colors.blue[600],
          title: Text("My favourite"),
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


    body: Card(
     elevation: 5,
     child: Padding(
       padding: EdgeInsets.all(7),
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
                          
                           ],),
                          
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
                            child:  Text(urecord.name,textAlign: TextAlign.right,)),
         
                           ]),
                            Row(children: [
                              
                            Text(urecord.email,textAlign: TextAlign.right,),]),
                            Row(children: [
                              Align(
                            alignment: Alignment.centerLeft,
                            child:  Text(urecord.add,textAlign: TextAlign.right,)),
         
                           ]),
                            
                             Row(children: [
                              
                            Text(urecord.phoneNo,textAlign: TextAlign.right,),]),
                            
                          ],
                          

                             

                           ),
                           ],),
                           
                            RaisedButton(
  
                            color: Colors.blue,
  
                             onPressed: () {
  
                               //Navigator.of(context).pop();
    Route route = MaterialPageRoute(builder: (context) => MyOrderPhoneSms(urecord,context));
  
                     Navigator.pushReplacement(context, route);
                             },
  
                             child: const Text(
  
                               "Confirm Booking",
                               style: TextStyle(color: Colors.black),
  
                             )),
                        
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
}