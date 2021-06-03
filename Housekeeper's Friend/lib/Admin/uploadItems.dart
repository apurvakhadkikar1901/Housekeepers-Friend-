//import 'dart:html';
//import 'dart:html'hide File;
import 'dart:io' ;
import 'dart:math';
//import 'package:cheaklist/main.dart';
import 'package:checklist/Admin/adminShiftOrders.dart';
//import 'package:checklist/Config/config.dart';
import 'package:checklist/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:e_shop/Admin/adminShiftOrders.dart';
// import 'package:e_shop/Widgets/loadingWidget.dart';
// import 'package:e_shop/main.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'package:image/image.dart' as ImD;


class UploadPage extends StatefulWidget
{
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> with AutomaticKeepAliveClientMixin<UploadPage>
{
  bool get wantKeepAlive => true;
  File file;
  String imageURL;
   
 

  @override
  Widget build(BuildContext context) {
    return displayAdminHomeScreen();
  }
displayAdminHomeScreen(){
return Scaffold(appBar: AppBar(flexibleSpace: Container(
  decoration: BoxDecoration(
                gradient: new LinearGradient(
              colors: [Colors.blue, Colors.blue[800]],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            )), 

),
  leading: IconButton(icon: Icon(Icons.border_color, color : Colors.white,),
  onPressed: (){
     Route route = MaterialPageRoute(builder: (c) => AdminShiftOrders());
                  Navigator.pushReplacement(context, route);
  },
  ),
actions: [
  FlatButton(child: Text("Logout",style:TextStyle(color: Colors.white,fontSize: 16.0,
  fontWeight: FontWeight.bold,),),
  
  onPressed: (){
    Route route = MaterialPageRoute(builder: (c) => SplashScreen());
                  Navigator.pushReplacement(context, route);
  },
  )
],

),

body: getAdminHomeScreenBody(),

);

}
getAdminHomeScreenBody()
{
  return Container(
    decoration: BoxDecoration(
                gradient: new LinearGradient(
              colors: [Colors.white, Colors.white],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),), 
            child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shop_two,color:Colors.blue[600],size : 200.0,),
              Padding(padding: EdgeInsets.only(top: 20.0),
                child: RaisedButton(color: Colors.blue[600],shape :RoundedRectangleBorder(borderRadius:BorderRadius.circular(9.0) ,
                ),
                
                child: Text("Add New Item ", style: TextStyle(fontSize: 20.0, color: Colors.white),),
                //color: Colors.white,
                onPressed: ()=> takeImage(context),
                
                )


              )
            ],
            ),),
  );


}

takeImage(mContext)
{
  return showDialog(context: mContext,
  builder:(con)
  {
    return SimpleDialog(
      title: Text("Item Image",  
      style :TextStyle(color: Colors.black, 
      fontWeight:  FontWeight.bold,),),
    
    children: [
      SimpleDialogOption(
        child: Text("Capture With Camera",
         style :TextStyle(color: Colors.blue[800], ),),
         onPressed: capturePhotosWithCamera,
       ),

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
capturePhotosWithCamera() async{
  Navigator.pop(context);
  File imageFile = await ImagePicker.pickImage(source: ImageSource.camera, maxHeight:680.0, maxWidth:970.0);
setState(() {
  file = imageFile;
  
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

    //   var file_upload = File(imageFile.path);
    //   if (imageFile != null) {
    //     // Upload data to firebase
    //     var snapshot = await _storage
    //         .ref()
    //         .child('/Image folder')
    //         .putFile(file_upload);

    //     var downloadUrl = await snapshot.ref.getDownloadURL();

    //     setState(() {
    //       //file = imageFile;
    //       imageURL = downloadUrl;
    //     });
    //   } else {
    //     print('No Path Received');
    //   }
    // } else {
    //   print('Grant Permissions and try again');
    // }
  }}


Future<void> _uploadImageToFirebase(File imageFile) async {
    try {
      // Make random image name.
      int randomNumber = Random().nextInt(100000);
      String imageLocation = 'images/image${randomNumber}.jpg';
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
      await FirebaseFirestore.instance.collection('storage').doc().set({'url':imageString , 'location':text});
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

class Record {
  final String location;
  final String url;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['location'] != null),
        assert(map['url'] != null),
        location = map['location'],
        url = map['url'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Record<$location:$url>";
}