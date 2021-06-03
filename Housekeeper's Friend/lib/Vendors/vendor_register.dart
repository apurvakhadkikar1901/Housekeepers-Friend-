import 'dart:core';
import 'dart:io';
// import 'dart:js_util';
// import 'dart:js';
import 'package:checklist/Config/config.dart';
import 'package:checklist/DialogBox/errorDialog.dart';
import 'package:checklist/DialogBox/loadingDialog.dart';
import 'package:checklist/Store/storehome.dart';
import 'package:checklist/Widgets/customTextField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:intl/message_format.dart';
//import 'package:path/path.dart';

class VendorRegister extends StatefulWidget {
  // VendorRegister({Key key}) : super(key: key);

  @override
  _VendorRegisterState createState() => _VendorRegisterState();
}

class _VendorRegisterState extends State<VendorRegister> {
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final TextEditingController _cPasswordTextEditingController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String userImageUrl = "";
  File _imageFile;

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width,
        _screenHeight = MediaQuery.of(context)
            .size
            .height; // used to make the site responsive
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 5.0,
            ),
            Container(
                child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Text(
                      "Register as a Users",
                      style: TextStyle(
                          color: Colors.blue[600],
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold),
                    ))),
            SizedBox(
              height: 2.0,
            ),

            // // InkWell(
            //   //onTap: _selectAndPickImage,
            //   child: CircleAvatar(
            //     radius: 0.15,
            //     backgroundColor: Colors.white,
            //     backgroundImage:
            //         _imageFile == null ? null : FileImage(_imageFile),
            //     child: _imageFile == null
            //         ? Icon(
            //             Icons.add_photo_alternate,
            //             size: _screenWidth = 0.15,
            //             color: Colors.grey,
            //           )
            //         : null,
            //   ),
            // ),
            // SizedBox(
            //   height: .0,
            // ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: _nameTextEditingController,
                    data: Icons.person,
                    hintText: "Name",
                    isObsecure: false,
                  ),
                  CustomTextField(
                    controller: _emailTextEditingController,
                    data: Icons.email,
                    hintText: "Email",
                    isObsecure: false,
                  ),
                  CustomTextField(
                    controller: _passwordTextEditingController,
                    data: Icons.person,
                    hintText: "Password",
                    isObsecure: true,
                  ),
                  CustomTextField(
                    controller: _cPasswordTextEditingController,
                    data: Icons.person,
                    hintText: "Confirm Password",
                    isObsecure: true,
                  )
                ],
              ),
            ),
            RaisedButton(
              onPressed: () {
                uploadAndSaveImage(context);
              },
              color: Colors.blue[800],
              child: Text(
                "Register as users",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: 4.0,
              width: _screenWidth = 0.8,
              color: Colors.pink,
            ),
            SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> uploadAndSaveImage(BuildContext context) async {
    if (_nameTextEditingController == null) {
      //var c;
      showDialog(
          context: context,
          builder: (context) {
            return ErrorAlertDialog(
              message: "please fill name ",
            );
          });
    } else {
      _passwordTextEditingController.text ==
              _cPasswordTextEditingController.text
          ? _emailTextEditingController.text.isNotEmpty &&
                  _passwordTextEditingController.text.isNotEmpty &&
                  _cPasswordTextEditingController.text.isNotEmpty &&
                  _nameTextEditingController.text.isNotEmpty
              ? uploadTOStorage(context)
              : displayDialog("Please Fill complete form", context)
          : displayDialog("password do not match", context);
    }
  }

  displayDialog(String msg, BuildContext context) {
    // var c;
    showDialog(
        context: context,
        builder: (context) {
          return ErrorAlertDialog(
            message: msg,
          );
        });
  }

  uploadTOStorage(BuildContext context) async {
    // var c;
    showDialog(
        context: context,
        builder: (context) {
          return LoadingAlertDialog(
            message: "Registering please wait....",
          );
        });

    //   String imageFileName = DateTime.now().millisecondsSinceEpoch.toString();

    //   Reference storageReferance =
    //       FirebaseStorage.instance.ref().child(imageFileName);

    //      UploadTask storageUploadTask = storageReferance.putFile(_imageFile);

    //   TaskSnapshot tasksnapshot = await storageUploadTask.onComplete;
    //   //TaskSnapshot taskSnapshot=await UploadTask.
    //   //.getDownloadURL();
    // //await (await uploadTask).ref.getDownloadURL();
    //   //.ref.getDownloadURL();
    //   await tasksnapshot.ref.getDownloadURL().then((urlImage) {
    //     userImageUrl = urlImage;

    _registerVendor(context);
    
//    });
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  void _registerVendor(BuildContext context) async {
    User user;
    // var c;
    await _auth
        .createUserWithEmailAndPassword(
      email: _emailTextEditingController.text.trim(),
      password: _passwordTextEditingController.text.trim(),
    )
        .then((_auth) {
      user = _auth.user;
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (context) {
            return ErrorAlertDialog(
              message: error.message.toString(),
            );
          });
    });
    if (user != null) {
      saveUserInfoToFireStore(user).then((value) {
        Navigator.pop(context);
        Route route = MaterialPageRoute(builder: (context) => StoreHome());
        Navigator.pushReplacement(context, route);
      });
    }
  }

  Future saveUserInfoToFireStore(User user) async {
    FirebaseFirestore.instance.collection("vendors").doc(user.uid).set(
        //collection("users").document(user.uid).setData(
        {
          "v_uid": user.uid,
          "v_email": user.email,
          "v_name": _nameTextEditingController.text.trim(),
          //"uid":user.uid,
          EcommerceApp.userCartList: ["garbagevalue"]
        });
    await EcommerceApp.sharedPreferences.setString("v_uid", user.uid);
    await EcommerceApp.sharedPreferences
        .setString(EcommerceApp.userEmail, user.email);
    await EcommerceApp.sharedPreferences
        .setString(EcommerceApp.userName, _nameTextEditingController.text);
    // await EcommerceApp.sharedPreferences
    //     .setString(EcommerceApp.userAvatarUrl, userImageUrl);
    await EcommerceApp.sharedPreferences
        .setStringList(EcommerceApp.userCartList, ["garbageValue"]);
  }
}
