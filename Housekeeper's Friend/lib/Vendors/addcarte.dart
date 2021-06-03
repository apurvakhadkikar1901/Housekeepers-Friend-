import 'package:checklist/Counters/cartitemcounter.dart';
import 'package:checklist/Store/storehome.dart';
import 'package:checklist/Vendors/electricianfom.dart';
import 'package:checklist/Vendors/maidForm.dart';
//import 'package:checklist/Vendors/maidhome.dart';
import 'package:checklist/Widgets/myDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class addtocarde extends StatelessWidget {
  Recorde recorde;
  BuildContext context;
  addtocarde(this.recorde, this.context);
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

                          ],)
                           


                           ],),])
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

    // Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: <Widget>[
    //     ListView.separated(
    //         itemBuilder: (context, index){
    //           return ListTile(
    //             title: Text(record.name),
    //             //trailing: Text("\$${cart[index].price}", style: TextStyle(color: Colors.redAccent, fontSize: 20, fontWeight: FontWeight.w500),),
    //             onTap: (){

    //             },
    //           );
    //         },
    //         separatorBuilder: (context, index){
    //           return Divider();
    //         },
            
    //         shrinkWrap: true,
    //     ),
    //     Divider(),
    //     //Text("Total : \$$sum"),

    //   ],
    // );
  }
}