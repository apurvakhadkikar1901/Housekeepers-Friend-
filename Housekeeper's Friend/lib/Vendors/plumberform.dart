


  import 'dart:io';
import 'dart:math';

import 'package:checklist/Address/addAddress.dart';
//import 'package:checklist/Address/address.dart';
import 'package:checklist/Authentication/authentication.dart';
import 'package:checklist/Authentication/profile.dart';
import 'package:checklist/Authentication/profile_p.dart';
import 'package:checklist/Authentication/profiles.dart';
//import 'package:checklist/Orders/myOrders.dart';
import 'package:checklist/Store/storehome.dart';
import 'package:checklist/Vendors/main1.dart';
import 'package:checklist/Vendors/myOrder_p.dart';
import 'package:checklist/Vendors/my_orders.dart';
import 'package:checklist/Widgets/MyDrawerVendor.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'plumberhome.dart';
//import 'package:checklist/Widgets/myDrawer.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'task.dart';
//import 'firestoreservice.dart';
//import 'vfromback/firestoreservice.dart';


class Plumber extends StatefulWidget {
  Plumber();
  @override
  _PlumberState createState() => _PlumberState();
}

class _PlumberState extends State<Plumber> {
  final _formKey = GlobalKey<FormState>();

  final myController = TextEditingController();
final _myControllerAdhar=TextEditingController();
  File file;
  String imageURL;

  String name,email,startDate,time,adharcard,hours,add;

String phoneNo;
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
  getTaskAdhar(adharcard){
    this.adharcard=adharcard;
  }
  getTaskhour(hours){
    this.hours=hours;
  }
   gettaskPhone(phoneNo){
    this.phoneNo=phoneNo;
  }


  int _myTaskType = 0;
  String taskVal;
  

  createData(){
    User user = FirebaseAuth.instance.currentUser;
    DocumentReference ds=FirebaseFirestore.instance.collection('plumber').doc(name);
    Map<String,dynamic> maidinfo = {
      "name":name,
       "email":email,
       "add":add,
        "startDate":startDate,
         "adharcard":adharcard,
          "hours":hours,
"phoneNo":phoneNo,
           //String name,email,startDate,time,adharcard,hours;

    };

    ds.set(maidinfo).whenComplete((){
      print("information updated");
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          
          backgroundColor: Colors.blue[600],
          title: Text("Plumber"),
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
              
                  ],
                ),
              )
            ]),
          ]
          ),
          drawer:MyDrawerVendor(),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
              child: Form(
                 key: _formKey,
                              child: Column(
          children: <Widget>[
           // _myAppBar(),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 80,
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: TextFormField(
                       // controller: _taskNameController,
                        onChanged: (String name){
                           getTaskName(name);   
                        },
                        decoration: InputDecoration(labelText: "Name: "),
                        validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Text is empty';
                }
                return null;
              },
                      ),
                      
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: TextFormField(
                        //controller: _taskDetailsController,
                        decoration: InputDecoration(labelText: "Email-id: "),
                        validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Text is empty';
                }
                return null;
              },
                        onChanged: (String email){
                           getTaskEmail(email);   
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                           controller: myController,
          maxLength: 10,
          maxLengthEnforced: true,
                       // controller: _taskNameController,
                        onChanged: (String phoneNo ){
                           gettaskPhone(phoneNo);   
                        },
                        decoration: InputDecoration(labelText: "Phone Number: "),
                        validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Text is empty';
                }
                return null;
              },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: TextFormField(
                       // controller: _taskNameController,
                        onChanged: (String add){
                           getTaskAdd(add);   
                        },
                        decoration: InputDecoration(labelText: "Address: "),
                        validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Text is empty';
                }
                return null;
              },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                           controller: _myControllerAdhar,
          maxLength: 12,
          maxLengthEnforced: true,
                        //controller: _taskDetailsController,
                        decoration: InputDecoration(labelText: "Adharcard Number: "),
                        validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Text is empty';
                }
                return null;
              },
                        onChanged: (String adharcard){
                           getTaskAdhar(adharcard);   
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: TextFormField(
                       // controller: _taskDateController,
                        decoration: InputDecoration(labelText: "Date: "),
                        validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Text is empty';
                }
                return null;
              },
                        onChanged: (String taskdate){
                           getTaskDate(startDate);   
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: TextFormField(
                      // controller: _taskTimeController,
                        decoration: InputDecoration(labelText: "hours: "),
                        validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Text is empty';
                }
                return null;
              },
                        onChanged: (String hours){
                           getTaskhour(hours);   
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                       child: RaisedButton(
                         onPressed: () => { takeImage(context),

                //incrementCounter()
            },
            child: new Text('Upload Image'),
                          )
                       
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    
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
                              if (_formKey.currentState.validate()){
                              createData();
                                Route route = MaterialPageRoute(builder: (context) => ProfileP());
                       Navigator.pushReplacement(context, route);
                              } 
                              
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
        padding: const EdgeInsets.only(top: 16.0),
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
      await FirebaseFirestore.instance.collection('maidImages').doc().set({'url':imageString , 'location':text});
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


  
class PlumberRecord {
  final String name;
  final String email;
  final String hour;
  final String add;
final String phoneNo;
  // final String adharcard;

  final DocumentReference reference;

  PlumberRecord.fromMap(Map<String, dynamic> map, {this.reference})
      :
        name = map['name'],
        email = map['email'],
        hour = map['hours'],
        add = map['add'],
phoneNo = map['phoneNo'];
        
        //email = map['email'];

  PlumberRecord.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "PlumberRecord<$name:$email:$hour:$add:$phoneNo>";
}  


class MyDrawers extends StatefulWidget{
  @override
  _MyDrawerStates createState() => _MyDrawerStates();
}

class _MyDrawerStates extends State<MyDrawers> {
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(children: [
        Container(padding:EdgeInsets.only(top:25.0,bottom:10.0),
        decoration: BoxDecoration(
                gradient: new LinearGradient(
              colors: [Colors.blue, Colors.blue[800]],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),),
            child:Column(children:[
              // Material(borderRadius: BorderRadius.all(Radius.circular(80.0)),
              // elevation: 8.0,
              // child:Container(
              //   height: 160.0,
              //   width: 160.0,
              //   child:CircleAvatar(backgroundImage: NetworkImage(EcommerceApp.sharedPreferences.getString(EcommerceApp.userAvatarUrl),
              //   ),)
            

SizedBox(height: 10.0),
Text("Welcome to HouseKeeper's Friend",
style: TextStyle(color: Colors.white,fontSize: 35.0,
fontFamily:"Signatra"),)

            ])
            
            ),
            
            SizedBox(height: 10.0),

Container(padding: EdgeInsets.only(top:1.0),
// decoration: BoxDecoration(
//                 gradient: new LinearGradient(
//               colors: [Colors.blue, Colors.blue[800]],
//               begin: const FractionalOffset(0.0, 0.0),
//               end: const FractionalOffset(1.0, 0.0),
//               stops: [0.0, 1.0],
//               tileMode: TileMode.clamp,
//             ),),
            
            child: Column(children: [
              ListTile(leading: Icon(Icons.home,color:Colors.blue[600]),
              title:Text("Home",style:TextStyle(color:Colors.black87),),
               onTap: () {
                  Route route = MaterialPageRoute(builder: (c) => MyAppp());
                  Navigator.pushReplacement(context, route);
                },
 ),
 Divider(height: 10.0, color:Colors.white, //thickness:6.0,
 ),


//  ListTile(leading: Icon(Icons.home,color:Colors.white),
//               title:Text("Home",style:TextStyle(color:Colors.white),),
//                onTap: () {
//                   Route route = MaterialPageRoute(builder: (c) => StoreHome());
//                   Navigator.pushReplacement(context, route);
//                 },
//  ),
//  Divider(height: 10.0, color:Colors.white, thickness:6.0,),



 ListTile(leading: Icon(Icons.shopping_bag,color:Colors.blue[600]),
              title:Text("My Orders",style:TextStyle(color:Colors.black87),),
               onTap: () {
                  Route route = MaterialPageRoute(builder: (c) => OrderHomesP());
                  Navigator.pushReplacement(context, route);
                },
 ),
 Divider(height: 10.0, color:Colors.white, //thickness:6.0,
 ),




//  ListTile(leading: Icon(Icons.shopping_cart,color:Colors.blue[600]),
//               title:Text("My Cart",style:TextStyle(color:Colors.black87),),
//                onTap: () {
//                   Route route = MaterialPageRoute(builder: (c) => CartPage());
//                   Navigator.pushReplacement(context, route);
//                 },
//  ),
//  Divider(height: 10.0, color:Colors.white,// thickness:6.0,
//  ),

// he me edit kela Donot need Serch Product


//  ListTile(leading: Icon(Icons.home,color:Colors.white),
//               title:Text("Search",style:TextStyle(color:Colors.white),),
//                onTap: () {
//                   Route route = MaterialPageRoute(builder: (c) => SearchProduct());
//                   Navigator.pushReplacement(context, route);
//                 },
//  ),
//  Divider(height: 10.0, color:Colors.white, //thickness:6.0,
//  ),



 ListTile(leading: Icon(Icons.home,color:Colors.blue[600]),
              title:Text("profile",style:TextStyle(color:Colors.black),),
               onTap: () {
                  Route route = MaterialPageRoute(builder: (c) => Profiles());
                  Navigator.pushReplacement(context, route);
                },
 ),
 Divider(height: 10.0, color:Colors.white, //thickness:6.0,
 ),



 ListTile(leading: Icon(Icons.logout,color:Colors.blue[600]),
              title:Text("Logout",style:TextStyle(color:Colors.black87),),
               onTap: () {

                  
                    Route route = MaterialPageRoute(builder: (c) => AuthenticScreen());
                  Navigator.pushReplacement(context, route);

                


                  
                },
 ),
 Divider(height: 10.0, color:Colors.white, //thickness:6.0,
 ),

  ],)
            
            )

            
            ],),);
  }
}


















