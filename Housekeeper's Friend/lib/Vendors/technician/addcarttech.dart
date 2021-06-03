import 'package:checklist/Counters/cartitemcounter.dart';
import 'package:checklist/Store/storehome.dart';
import 'package:checklist/Vendors/technician/technicianfom.dart';
//import 'package:checklist/Vendors/maidhome.dart';
import 'package:checklist/Widgets/myDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class addtocardt extends StatelessWidget {
  Recordt recordt;
  BuildContext context;
  addtocardt(this.recordt, this.context);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
         
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
          drawer:MyDrawer(),


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
                           
                            Image.network("https://mpng.subpng.com/20180408/pxq/kisspng-computer-icons-technician-technical-support-web-5aca239185d704.8266128515231968175482.jpg",height: 100,width: 100,),
                            
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
                            child:  Text(recordt.name,textAlign: TextAlign.right,)),
         
                           ]),
                            Row(children: [
                              
                            Text(recordt.email,textAlign: TextAlign.right,),]),
                            Row(children: [
                              Align(
                            alignment: Alignment.centerLeft,
                            child:  Text(recordt.add,textAlign: TextAlign.right,)),
         
                           ]),
                            
                            Row(children: [
                             Icon(Icons.lock_clock),
                           Text(recordt.hour,style: TextStyle(
    color: Colors.green),textAlign: TextAlign.left,),
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
}