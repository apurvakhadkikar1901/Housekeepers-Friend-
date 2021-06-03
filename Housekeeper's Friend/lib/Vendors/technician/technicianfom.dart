
//  apurva created
//import 'dart:html';
import 'dart:io';
import 'dart:math';

import 'package:checklist/Authentication/profile_t.dart';
import 'package:checklist/Store/storehome.dart';
import 'package:checklist/Vendors/maidForm.dart';
import 'package:checklist/Widgets/MyDrawerVendorT.dart';
import 'package:checklist/Widgets/myDrawer.dart';
//import 'package:checklist/services/firestoreservice.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'task.dart';
//import 'firestoreservice.dart';
//import 'vfromback/firestoreservice.dart';


class Techniciant extends StatefulWidget {
  Techniciant();
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<Techniciant> {
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
    DocumentReference ds=FirebaseFirestore.instance.collection('technician').doc(name);
    Map<String,dynamic> tecinfo = {
      "name":name,
       "email":email,
        "startDate":startDate,
         "adharcard":adharcard,
          "hours":hours,
          "phoneNo":phoneNo,
          "add":add

           //String name,email,startDate,time,adharcard,hours;

    };

    ds.set(tecinfo).whenComplete((){
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
                  ],
                ),
              )
            ]),
          ]
          ),
          drawer:MyDrawerVendorTechnician(),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
              child: Form(
                 key: _formKey,
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
                           controller: myController,
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
                               Route route = MaterialPageRoute(builder: (context) => ProfileT());
                      Navigator.pushReplacement(context, route);
                            }},
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
      String imageLocation = 'tecimages/tecimage${randomNumber}.jpg';
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
      await FirebaseFirestore.instance.collection('techImages').doc().set({'url':imageString , 'location':text});
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
class Recordt {
  final String name;
  final String email;
  final String hour;
  final String add;
  final String phoneNo;

  // final String adharcard;

  final DocumentReference reference;

  Recordt.fromMap(Map<String, dynamic> map, {this.reference})
      :
        name = map['name'],
        email = map['email'],
        hour = map['hours'],
        add = map['add'],
        phoneNo = map['phoneNo'];
        
        //email = map['email'];

  Recordt.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Recorde<$name:$email:$hour:$add:$phoneNo>";
}  

    







