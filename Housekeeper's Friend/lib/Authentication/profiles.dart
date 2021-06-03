//import 'dart:html';
import 'dart:io' ;
import 'package:checklist/Config/config.dart';
import 'package:checklist/Widgets/myDrawer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
File _image;
class Profiles extends StatefulWidget {
  @override
  bool get wantKeepAlive => true;
  //File file;
  String imageURL;
  
  final picker = ImagePicker();
  
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profiles> {
  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
   title: new Text("Profile",  style: TextStyle(fontFamily: 'Open Sans', fontWeight: FontWeight.bold)),
        // leading: Padding(
        //   padding: const EdgeInsets.all(3.0),
        //   child: Image.asset(
        //     "images/houselogo.PNG",
        //     scale: 10.0,
        //   )
        // ),
      
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
         // backgroundColor: Colors.blue[600],
          //title: Text("Profile"),
          //centerTitle: true,

          //create shopping icon in app bar
          // actions: [
          //   Stack(children:<Widget> [
          //     // IconButton(
          //     //   icon: Icon(
          //     //     Icons.shopping_cart,
          //     //     color: Colors.white,
          //     //   ),
          //       // onPressed: () {
          //       //   Route route = MaterialPageRoute(builder: (context) => StoreHome());
          //       //   Navigator.pushReplacement(context, route);
          //       // },
              
          //     Positioned(
          //       child: Stack(
          //         children: [
          //           // Icon(
          //           //   Icons.brightness_1,
          //           //   size: 20.0,
          //           //   color: Colors.black,
          //           // ),
          //         // Positioned(
          //         //     top:3.0,
          //         //     bottom:4.0,
          //         //     child:(Consumer<CartItemCounter>
          //         //     (builder: (context,counter, _)
          //         //     {
          //         //       return Text(
          //         //         counter.count.toString(),
          //         //         style: TextStyle(color:Colors.white, fontSize: 12.0, fontWeight:FontWeight.w500),

          //         //       );

          //         //     }
          //         //     )
          //         //   )
          //         // )
          //         ],
          //       ),
          //     )
          //   ]),
          // ]
          ),
          drawer:MyDrawer(),
              
          
          
          
      
      body:  Container(
        
         margin: EdgeInsets.all(20),
        height: double.infinity,
                width: double.infinity,
                child: Center(
                  
                  child:Expanded(
                                      child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                 Container(
                    height: 150,
                    width: 300,
                      child: Column(children:[
              Material(borderRadius: BorderRadius.all(Radius.circular(80.0)),
              elevation: 8.0,
              child:Container(
                
                height: 140.0,
                width: 140.0,
                child:InkWell(
                  
                  onTap: getImage,
                 // File _image;
 
                                  child: CircleAvatar(
                     backgroundColor: Colors.blueAccent,
        //radius: radius,
        child: CircleAvatar(
           backgroundColor: Colors.black,
    radius: 40.0,
            //radius: radius - 5,
            child: CircleAvatar(
      radius: 38.0,
      child: ClipOval(
        child: (_image != null)
        ? Image.file(_image)
        : Image.asset('images/profilePic.PNG'),
      ),
      backgroundColor: Colors.white,
    ),
  ),
        ),
                    //child: Image.asset('images/profilePic.PNG',),
                    
                    
                    //backgroundImage: Image,
                      //backgroundImage: NetworkImage(EcommerceApp.sharedPreferences.getString(EcommerceApp.userAvatarUrl),
                  ),
                ), // takeImage(context),
                    )
              ,],)
                    
                    ),
                    SizedBox(
                    height:40.0,
                    ),
                    Container(
                    
                      child:Text(
                        
                        "Username",
                        textAlign: TextAlign.left,
                        style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0,color: Colors.black,
                      ),
                    ),
                    

                      ),
                      SizedBox(
                    height: 5.0,
                    ),

                      Container(
                        child:Text(
                        EcommerceApp.sharedPreferences.getString(EcommerceApp.userName),
                       
                        textAlign: TextAlign.left,
                        style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 16.0,color: Colors.black,
                      ),
                    ),

                      ),
                      SizedBox(
                        height:25.0,
                      ),
                      
                      Container(
                      child:Text(
                        "Email",
                        style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0,color: Colors.black,
                      ),
                    ),
                      ),
                       SizedBox(
                    height: 5.0,
                    ),
                         Container(
                        child:Text(
                        EcommerceApp.sharedPreferences.getString(EcommerceApp.userEmail),
                        textAlign: TextAlign.left,
                        style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 16.0,color: Colors.black,
                      ),
                    ),

                      ),
                       SizedBox(
                        height:25.0,
                      ),
                    // Container(
                    //   child:Text(
                    //     "Password",
                    //     style:
                    //     TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0,color: Colors.black,
                    //   ),
                    // ),

                    //   ),
                    //    SizedBox(
                    // height: 5.0,
                    // ),
                    //   Container(
                    //     child:Text(
                    //     "1234567890",
                    //     textAlign: TextAlign.left,
                    //     style:
                    //     TextStyle(fontWeight: FontWeight.normal, fontSize: 16.0,color: Colors.black,
                    //   ),
                    // ),

                    //   ),   
              ]),
                  )

                  ),
      ));
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

}
