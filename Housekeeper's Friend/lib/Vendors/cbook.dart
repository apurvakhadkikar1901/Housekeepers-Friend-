
// //  apurva created
// //import 'dart:html';
// import 'dart:io';
// import 'dart:math';

// import 'package:checklist/Store/storehome.dart';
// import 'package:checklist/Widgets/myDrawer.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// //import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
// //import 'task.dart';
// //import 'firestoreservice.dart';
// //import 'vfromback/firestoreservice.dart';

// class Maid extends StatefulWidget {
//   Maid();
//   @override
//   _MaidState createState() => _MaidState();
// }

// class _MaidState extends State<Maid> {
//   File file;
//   String imageURL;

//   String name,email,startDate,time,adharcard,hours;

//   getTaskName(name){
//     this.name=name;
//   }
//   getTaskEmail(email){
//     this.email=email;
//   }
//   getTaskDate(startDate){
//     this.startDate=startDate;
//   }
//   getTaskTime(time){
//     this.time=time;
//   }
//   getTaskAdhar(adharcard){
//     this.adharcard=adharcard;
//   }
//   getTaskhour(hours){
//     this.hours=hours;
//   }

//   int _myTaskType = 0;
//   String taskVal;
//   // void _handleTaskType(int value) {
//   //   setState(() {
//   //     _myTaskType = value;
//   //     switch (_myTaskType) {
//   //       case 1:
//   //        taskVal='travel';
//   //         break;
//   //       case 2:
//   //          taskVal='shopping';
//   //         break;
//   //       case 3:
//   //          taskVal='gym';
//   //         break;
//   //       case 4:
//   //          taskVal='party';
//   //         break;
//   //       case 5:
//   //          taskVal='others';
//   //         break;
//   //     }
//   //   });
//   // }

//   createData(){
//     DocumentReference ds=FirebaseFirestore.instance.collection('maid').doc(name);
//     Map<String,dynamic> maidinfo = {
//       "name":name,
//        "email":email,
//         "startDate":startDate,
//          "adharcard":adharcard,
//           "hours":hours,

//            //String name,email,startDate,time,adharcard,hours;

//     };

//     ds.set(maidinfo).whenComplete((){
//       print("information updated");
//     });

//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        appBar: AppBar(
//           // flexibleSpace: Container(
//           //   // decoration: BoxDecoration(
//           //   //     gradient: new LinearGradient(
//           //   //   colors: [Colors.blue, Colors.blue[100]],
//           //   //   begin: const FractionalOffset(0.0, 0.0),
//           //   //   end: const FractionalOffset(1.0, 0.0),
//           //   //   stops: [0.0, 1.0],
//           //   //   tileMode: TileMode.clamp,
//           //   // )),
//           // )
//           backgroundColor: Colors.blue[600],
//           title: Text("Maid"),
//           centerTitle: true,

//           //create shopping icon in app bar
//           actions: [
//             Stack(children:<Widget> [
//               IconButton(
//                 icon: Icon(
//                   Icons.shopping_cart,
//                   color: Colors.white,
//                 ),
//                 onPressed: () {
//                   Route route = MaterialPageRoute(builder: (context) => StoreHome());
//                   Navigator.pushReplacement(context, route);
//                 },
//               ),
//               Positioned(
//                 child: Stack(
//                   children: [
//                     Icon(
//                       Icons.brightness_1,
//                       size: 20.0,
//                       color: Colors.black,
//                     ),
//                   // Positioned(
//                   //     top:3.0,
//                   //     bottom:4.0,
//                   //     child:(Consumer<CartItemCounter>
//                   //     (builder: (context,counter, _)
//                   //     {
//                   //       return Text(
//                   //         counter.count.toString(),
//                   //         style: TextStyle(color:Colors.white, fontSize: 12.0, fontWeight:FontWeight.w500),

//                   //       );

//                   //     }
//                   //     )
//                   //   )
//                   // )
//                   ],
//                 ),
//               )
//             ]),
//           ]
//           ),
//           drawer:MyDrawer(),
//       resizeToAvoidBottomInset: false,
//       body: Column(
//         children: <Widget>[
//          // _myAppBar(),
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height - 100,
//             child: ListView(
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.only(left: 16.0, right: 16.0),
//                   child: TextField(
//                    // controller: _taskNameController,
//                     onChanged: (String name){
//                        getTaskName(name);   
//                     },
//                     decoration: InputDecoration(labelText: "Name: "),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 16.0, right: 16.0),
//                   child: TextField(
//                     //controller: _taskDetailsController,
//                     decoration: InputDecoration(labelText: "Email-id: "),
//                     onChanged: (String email){
//                        getTaskEmail(email);   
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 16.0, right: 16.0),
//                   child: TextField(
//                     //controller: _taskDetailsController,
//                     decoration: InputDecoration(labelText: "Adharcard Number: "),
//                     onChanged: (String adharcard){
//                        getTaskAdhar(adharcard);   
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 16.0, right: 16.0),
//                   child: TextField(
//                    // controller: _taskDateController,
//                     decoration: InputDecoration(labelText: "Date: "),
//                     onChanged: (String taskdate){
//                        getTaskDate(startDate);   
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 16.0, right: 16.0),
//                   child: TextField(
//                   // controller: _taskTimeController,
//                     decoration: InputDecoration(labelText: "hours: "),
//                     onChanged: (String hours){
//                        getTaskhour(hours);   
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 16.0, right: 16.0),
//                    child: RaisedButton(
//                      onPressed: () => { takeImage(context),

//             //incrementCounter()
//           },
//           child: new Text('Upload Image'),
//                       )
//                    //TextField(
//                   // // controller: _taskTimeController,
//                   //   decoration: InputDecoration(labelText: "upload Image: "),
                    
//                   //   // onChanged: (String hours){
//                   //   //    getTaskhour(hours);   
//                   //   // },
//                   // ),
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 // Center(
//                 //   child: Text(
//                 //     'Select Task Type:',
//                 //     style:
//                 //         TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//                 //   ),
//                 // ),
//                 // Column(
//                 //   mainAxisAlignment: MainAxisAlignment.center,
//                 //   children: <Widget>[
//                 //     Row(
//                 //       mainAxisAlignment: MainAxisAlignment.start,
//                 //       children: <Widget>[
//                 //         Radio(
//                 //           value: 1,
//                 //           groupValue: _myTaskType,
//                 //           onChanged: _handleTaskType,
//                 //           activeColor: Color(0xff4158ba),
//                 //         ),
//                 //         Text(
//                 //           'Travel',
//                 //           style: TextStyle(fontSize: 16.0),
//                 //         ),
//                 //       ],
//                 //     ),
//                 //     Row(
//                 //       mainAxisAlignment: MainAxisAlignment.start,
//                 //       children: <Widget>[
//                 //         Radio(
//                 //           value: 2,
//                 //           groupValue: _myTaskType,
//                 //           onChanged: _handleTaskType,
//                 //           activeColor: Color(0xfffb537f),
//                 //         ),
//                 //         Text(
//                 //           'Shopping',
//                 //           style: TextStyle(
//                 //             fontSize: 16.0,
//                 //           ),
//                 //         ),
//                 //       ],
//                 //     ),
//                 //     Row(
//                 //       mainAxisAlignment: MainAxisAlignment.start,
//                 //       children: <Widget>[
//                 //         Radio(
//                 //           value: 3,
//                 //           groupValue: _myTaskType,
//                 //           onChanged: _handleTaskType,
//                 //           activeColor: Color(0xff4caf50),
//                 //         ),
//                 //         Text(
//                 //           'Gym',
//                 //           style: TextStyle(fontSize: 16.0),
//                 //         ),
//                 //       ],
//                 //     ),
//                 //     Row(
//                 //       mainAxisAlignment: MainAxisAlignment.start,
//                 //       children: <Widget>[
//                 //         Radio(
//                 //           value: 4,
//                 //           groupValue: _myTaskType,
//                 //           onChanged: _handleTaskType,
//                 //           activeColor: Color(0xff9962d0),
//                 //         ),
//                 //         Text(
//                 //           'Party',
//                 //           style: TextStyle(fontSize: 16.0),
//                 //         ),
//                 //       ],
//                 //     ),
//                 //     Row(
//                 //       mainAxisAlignment: MainAxisAlignment.start,
//                 //       children: <Widget>[
//                 //         Radio(
//                 //           value: 5,
//                 //           groupValue: _myTaskType,
//                 //           onChanged: _handleTaskType,
//                 //           activeColor: Color(0xff0dc8f5),
//                 //         ),
//                 //         Text(
//                 //           'Others',
//                 //           style: TextStyle(fontSize: 16.0),
//                 //         ),
//                 //       ],
//                 //     ),
//                 //   ],
//                 // ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     RaisedButton(
//                         color: Colors.blue,
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                         child: const Text(
//                           "Cancel",
//                           style: TextStyle(color: Colors.black),
//                         )),
//                     // This button results in adding the contact to the database
//                     RaisedButton(
//                         color: Colors.blue,
//                         onPressed: () {
//                           createData();
//                         },
//                         child: const Text(
//                           "Submit",
//                           style: TextStyle(color: Colors.black),
//                         ))
//                   ],
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _myAppBar() {
//     return Container(
//       height: 80.0,
//       width: MediaQuery.of(context).size.width,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//             colors: [
//               const Color(0xFFFA7397),
//               const Color(0xFFFDDE42),
//             ],
//             begin: const FractionalOffset(0.0, 0.0),
//             end: const FractionalOffset(1.0, 0.0),
//             stops: [0.0, 1.0],
//             tileMode: TileMode.clamp),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(top: 16.0),
//         child: Center(
//             child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             Expanded(
//               flex: 1,
//               child: Container(
//                 child: IconButton(
//                     icon: Icon(
//                       Icons.arrow_back,
//                       color: Colors.white,
//                     ),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     }),
//               ),
//             ),
//             Expanded(
//               flex: 5,
//               child: Container(
//                 child: Text(
//                   'New Tasks',
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20.0),
//                 ),
//               ),
//             ),
//           ],
//         )),
//       ),
//     );
//   }

//   takeImage(BuildContext context) {
//     return showDialog(context: context,
//   builder:(con)
//   {
//     return SimpleDialog(
//       title: Text("Item Image",  
//       style :TextStyle(color: Colors.black, 
//       fontWeight:  FontWeight.bold,),),
    
//     children: [
//       // SimpleDialogOption(
//       //   child: Text("Capture With Camera",
//       //    style :TextStyle(color: Colors.blue[800], ),),
//       //    onPressed: capturePhotosWithCamera,
//       //  ),

//       SimpleDialogOption(
//         child: Text("Select from gallery",
//          style :TextStyle(color: Colors.blue[800], ),),
//          onPressed: pickPhotoFromGallery,
         

//       ),
//       SimpleDialogOption(
//         child: Text("Cancel",
//          style :TextStyle(color: Colors.black, ),),
//          onPressed: (){
//            Navigator.pop(context);
//          },
//        )
//     ],    
//     );
//   }
//   );

//   }

//   pickPhotoFromGallery() async{
//     Navigator.pop(context);
//     final _storage = FirebaseStorage.instance;
//     //check permissions

//     await Permission.photos.request();
//     var permissionStatus = await Permission.photos.status;
//     if (permissionStatus.isGranted) {
//       File imageFile = await ImagePicker.pickImage(
//         source: ImageSource.gallery,
         
//       );
//       _uploadImageToFirebase(imageFile); 

//   }
// }

//  Future<void> _uploadImageToFirebase(File imageFile) async {
//     try {
//       // Make random image name.
//       int randomNumber = Random().nextInt(100000);
//       String imageLocation = 'maidimages/maidimage${randomNumber}.jpg';
//       FirebaseStorage storage = FirebaseStorage.instance;
//       final Reference ref = storage.ref().child(imageLocation);
//       final UploadTask uploadTask = ref.putFile(imageFile);
//       uploadTask.then((res){
//         _addPathToDatabase(imageLocation);
//         //res.ref.getDownloadURL();
//       });
      
      
      
      

//       // Upload image to firebase.
//       // final StorageReference storageReference = FirebaseStorage().ref().child(imageLocation);
//       // final StorageUploadTask uploadTask = storageReference.putFile(image);
//       // await uploadTask.onComplete;
//       // _addPathToDatabase(imageLocation);
//     }
//     catch(e){
//       print(e.message);
//     }
//   }

//   Future<void> _addPathToDatabase(String text) async {
//     try {
//       FirebaseStorage storage = FirebaseStorage.instance;
//       // Get image URL from firebase
//       final ref = storage.ref().child(text);
//       var imageString = await ref.getDownloadURL();

//       // Add location and url to database
//       await FirebaseFirestore.instance.collection('maidImages').doc().set({'url':imageString , 'location':text});
//     }catch(e){
//       print(e.message);
//       showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               content: Text(e.message),
//             );
//           }
//       );
//     }
//   }
// }

  //import 'dart:html';
import 'dart:io';
import 'dart:math';

//import 'package:checklist/Address/address.dart';
import 'package:checklist/Vendors/alert_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import 'maidhome.dart';
import 'package:checklist/Widgets/myDrawer.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'task.dart';
//import 'firestoreservice.dart';
//import 'vfromback/firestoreservice.dart';


class cbook extends StatefulWidget {
  cbook();
  @override
  _cbookState createState() => _cbookState();
}

class _cbookState extends State<cbook> {
  File file;
  String imageURL;

  String name,email,startDate,time,adharcard,hours,add,url;

  var storage;

  getTaskName(name){
    this.name=name;
  }
  getTaskAdd(add){
    this.add=add;
  }
  getTaskEmail(email){
    this.email=email;
  }
  getTaskDate(startDate){
    this.startDate=startDate;
  }
  getTaskTime(time){
    this.time=time;
  }
  // getTaskAdhar(adharcard){
  //   this.adharcard=adharcard;
  // }
  getTaskhour(hours){
    this.hours=hours;
  }
  // getTaskurl(text) async {
  //   FirebaseStorage storage = FirebaseStorage.instance;
  //   final ref = storage.ref().child(text);
  //   var url = await ref.getDownloadURL();
  //   //this.url=url;
  // }

  int _myTaskType = 0;
  String taskVal;
  // void _handleTaskType(int value) {
  //   setState(() {
  //     _myTaskType = value;
  //     switch (_myTaskType) {
  //       case 1:
  //        taskVal='travel';
  //         break;
  //       case 2:
  //          taskVal='shopping';
  //         break;
  //       case 3:
  //          taskVal='gym';
  //         break;
  //       case 4:
  //          taskVal='party';
  //         break;
  //       case 5:
  //          taskVal='others';createData
  //         break;
  //     }
  //   });
  // }

  createData(){
    User user = FirebaseAuth.instance.currentUser;
    CollectionReference ds=FirebaseFirestore.instance.collection('book').doc(user.uid).collection('user_booking');
    // await FirebaseFirestore
    // .instance
    // .collection('orders')
    // .doc(user.uid)
    // .collection(
    //     "user_orders")
    // .add({
    //     //add your data that you want to upload
    //     });
    
    Map<String,dynamic> custinfo = {
      "name":name,
       "email":email,
       "add":add,
        "startDate":startDate,
         //"adharcard":adharcard,
          // "hours":hours,
          //  "url":url,

           //String name,email,startDate,time,adharcard,hours;

    };

    ds.add(custinfo).whenComplete((){
      print("information updated");
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: Text("Fill  Below Form"),
          centerTitle: true,

          //create shopping icon in app bar
          actions: [
            Stack(children:<Widget> [
              // IconButton(
              //   icon: Icon(
              //     Icons.shopping_cart,
              //     color: Colors.white,
              //   ),
              //   onPressed: () {
              //     Route route = MaterialPageRoute(builder: (context) => maidhome());
              //     Navigator.pushReplacement(context, route);
              //   },
             //),
              Positioned(
                child: Stack(
                  children: [
                    Icon(
                      Icons.brightness_1,
                      size: 20.0,
                      color: Colors.black,
                    ),
                  // Positioned(
                  //     top:3.0,
                  //     bottom:4.0,
                  //     child:(Consumer<CartItemCounter>
                  //     (builder: (context,counter, _)
                  //     {
                  //       return Text(
                  //         counter.count.toString(),
                  //         style: TextStyle(color:Colors.white, fontSize: 12.0, fontWeight:FontWeight.w500),

                  //       );

                  //     }
                  //     )
                  //   )
                  // )
                  ],
                ),
              )
            ]),
          ]
          ),
          drawer:MyDrawer(),
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: <Widget>[
           // _myAppBar(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 100,
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: TextField(
                      decoration: InputDecoration(labelText: "Name: "),
                     // controller: _taskNameController,
                      onChanged: (String name){
                         getTaskName(name);   
                      },
                      
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: TextField(
                      //controller: _taskDetailsController,
                      decoration: InputDecoration(labelText: "Email-id: "),
                      onChanged: (String email){
                         getTaskEmail(email);   
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: TextField(
                      decoration: InputDecoration(labelText: "Address: "),
                     
                     // controller: _taskNameController,
                      onChanged: (String add){
                         getTaskAdd(add);   
                      },
                      
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  //   child: TextField(
                  //     //controller: _taskDetailsController,
                  //     decoration: InputDecoration(labelText: "Adharcard Number: "),
                  //     onChanged: (String adharcard){
                  //        getTaskAdhar(adharcard);   
                  //     },
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: TextField(
                     // controller: _taskDateController,
                      decoration: InputDecoration(labelText: "Date: "),
                      onChanged: (String taskdate){
                         getTaskDate(startDate);   
                      },
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  //   child: TextField(
                  //   // controller: _taskTimeController,
                  //     decoration: InputDecoration(labelText: "hours: "),
                  //     onChanged: (String hours){
                  //        getTaskhour(hours);   
                  //     },
                  //   ),
                  // ),
            //       Padding(
            //         padding: EdgeInsets.only(left: 16.0, right: 16.0),
            //          child: RaisedButton(
            //            onPressed: () => { takeImage(context),

            //   //incrementCounter()
            // },
            // child: new Text('Upload Image'),
            //             )
            //          //TextField(
            //         // // controller: _taskTimeController,
            //         //   decoration: InputDecoration(labelText: "upload Image: "),
                      
            //         //   // onChanged: (String hours){
            //         //   //    getTaskhour(hours);   
            //         //   // },
            //         // ),
            //       ),
                  SizedBox(
                    height: 5.0,
                  ),
                  // Center(
                  //   child: Text(
                  //     'Select Task Type:',
                  //     style:
                  //         TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: <Widget>[
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: <Widget>[
                  //         Radio(
                  //           value: 1,
                  //           groupValue: _myTaskType,
                  //           onChanged: _handleTaskType,
                  //           activeColor: Color(0xff4158ba),
                  //         ),
                  //         Text(
                  //           'Travel',
                  //           style: TextStyle(fontSize: 16.0),
                  //         ),
                  //       ],
                  //     ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: <Widget>[
                  //         Radio(
                  //           value: 2,
                  //           groupValue: _myTaskType,
                  //           onChanged: _handleTaskType,
                  //           activeColor: Color(0xfffb537f),
                  //         ),
                  //         Text(
                  //           'Shopping',
                  //           style: TextStyle(
                  //             fontSize: 16.0,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: <Widget>[
                  //         Radio(
                  //           value: 3,
                  //           groupValue: _myTaskType,
                  //           onChanged: _handleTaskType,
                  //           activeColor: Color(0xff4caf50),
                  //         ),
                  //         Text(
                  //           'Gym',
                  //           style: TextStyle(fontSize: 16.0),
                  //         ),
                  //       ],
                  //     ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: <Widget>[
                  //         Radio(
                  //           value: 4,
                  //           groupValue: _myTaskType,
                  //           onChanged: _handleTaskType,
                  //           activeColor: Color(0xff9962d0),
                  //         ),
                  //         Text(
                  //           'Party',
                  //           style: TextStyle(fontSize: 16.0),
                  //         ),
                  //       ],
                  //     ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: <Widget>[
                  //         Radio(
                  //           value: 5,
                  //           groupValue: _myTaskType,
                  //           onChanged: _handleTaskType,
                  //           activeColor: Color(0xff0dc8f5),
                  //         ),
                  //         Text(
                  //           'Others',
                  //           style: TextStyle(fontSize: 16.0),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                          color: Colors.blue,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: Colors.black),
                          )),
                      // This button results in adding the contact to the database
                      RaisedButton(
                          color: Colors.blue,
                          onPressed: () {
                            createData();
                            Route route = MaterialPageRoute(builder: (context) => AlertUser());
                    Navigator.pushReplacement(context, route);
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _myAppBar() {
    return Container(
      height: 80.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              const Color(0xFFFA7397),
              const Color(0xFFFDDE42),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: Text(
                  'New Tasks',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }

  takeImage(BuildContext context) {
    return showDialog(context: context,
  builder:(con)
  {
    return SimpleDialog(
      title: Text("Item Image",  
      style :TextStyle(color: Colors.black, 
      fontWeight:  FontWeight.bold,),),
    
    children: [
      // SimpleDialogOption(
      //   child: Text("Capture With Camera",
      //    style :TextStyle(color: Colors.blue[800], ),),
      //    onPressed: capturePhotosWithCamera,
      //  ),

      SimpleDialogOption(
        child: Text("Select from gallery",
         style :TextStyle(color: Colors.blue[800], ),),
         onPressed: pickPhotoFromGallery,
         

      ),
      SimpleDialogOption(
        child: Text("Cancel",
         style :TextStyle(color: Colors.black, ),),
         onPressed: (){
           Navigator.pop(context);
         },
       )
    ],    
    );
  }
  );

  }

  pickPhotoFromGallery() async{
    Navigator.pop(context);
    final _storage = FirebaseStorage.instance;
    //check permissions

    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted) {
      File imageFile = await ImagePicker.pickImage(
        source: ImageSource.gallery,
         
      );
      _uploadImageToFirebase(imageFile); 

  }
}

 Future<void> _uploadImageToFirebase(File imageFile) async {
    try {
      // Make random image name.
      int randomNumber = Random().nextInt(100000);
      String imageLocation = 'maidimages/maidimage${randomNumber}.jpg';
      FirebaseStorage storage = FirebaseStorage.instance;
      final Reference ref = storage.ref().child(imageLocation);
      final UploadTask uploadTask = ref.putFile(imageFile);
      uploadTask.then((res){
        _addPathToDatabase(imageLocation);
        //res.ref.getDownloadURL();
      });
      
      
      
      

      // Upload image to firebase.
      // final StorageReference storageReference = FirebaseStorage().ref().child(imageLocation);
      // final StorageUploadTask uploadTask = storageReference.putFile(image);
      // await uploadTask.onComplete;
      // _addPathToDatabase(imageLocation);
    }
    catch(e){
      print(e.message);
    }
  }

  Future<void> _addPathToDatabase(String text) async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      // Get image URL from firebase
      final ref = storage.ref().child(text);
      var imageString = await ref.getDownloadURL();

      // Add location and url to database
      await FirebaseFirestore.instance.collection('maid').doc().set({'url':imageString , 'location':text});
    }catch(e){
      print(e.message);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message),
            );
          }
      );
    }
  }
}
class Records2 {
  final String location;
  final String url;
  final DocumentReference reference;

  Records2.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['location'] != null),
        assert(map['url'] != null),
        location = map['location'],
        url = map['url'];

  Records2.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Record<$location:$url>";
}

// class Record1 {
//   final String name;
//   final String email;
//   final String hour;
//   final String add;

//   // final String adharcard;

//   final DocumentReference reference;

//   Record1.fromMap(Map<String, dynamic> map, {this.reference})
//       :
//         name = map['name'],
//         email = map['email'],
//         hour = map['hours'],
//         add = map['add'];

        
//         //email = map['email'];

//   Record1.fromSnapshot(DocumentSnapshot snapshot)
//       : this.fromMap(snapshot.data(), reference: snapshot.reference);

//   @override
//   String toString() => "Record1<$name:$email:$hour:$add>";
// }  







