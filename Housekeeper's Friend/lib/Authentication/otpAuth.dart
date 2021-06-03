import 'package:flutter/material.dart';
 import 'package:firebase_auth/firebase_auth.dart';
 import 'package:flutter/services.dart';
 import 'homepage.dart';

 void main() => runApp(MyAppps());

 class MyAppps extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title: 'Phone Authentication',
       routes: <String, WidgetBuilder>{
         '/homepage': (BuildContext context) => MyHome(),
         '/loginpage': (BuildContext context) => MyAppps(),
       },
       theme: ThemeData(
         primarySwatch: Colors.blue,
       ),
       home: MyAppPage(title: 'Grocery'),
     );
  }
 }

 class MyAppPage extends StatefulWidget {
   MyAppPage({Key key, this.title}) : super(key: key);
   final String title;

   @override
   _MyAppPageState createState() => _MyAppPageState();
 }

 class _MyAppPageState extends State<MyAppPage> {
   String phoneNo;
   String smsOTP;
   String verificationId;
   String errorMessage = '';
   FirebaseAuth _auth = FirebaseAuth.instance;

   Future<void> verifyPhone() async {
     final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
       this.verificationId = verId;
       smsOTPDialog(context).then((value) {
         print('sign in');
       });
     };
     try {
       await _auth.verifyPhoneNumber(
           phoneNumber: this.phoneNo, // PHONE NUMBER TO SEND OTP
           codeAutoRetrievalTimeout: (String verId) {
             //Starts the phone number verification process for the given phone number.
             //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
             this.verificationId = verId;
           },
           codeSent:
              smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
           timeout: const Duration(seconds: 20),
           verificationCompleted: (AuthCredential phoneAuthCredential) {
             print(phoneAuthCredential);
           },
           verificationFailed: (FirebaseAuthException exceptio) {
             print('${exceptio.message}');
           });
   } catch (e) {
       handleError(e);
     }
   }
   Future<bool> smsOTPDialog(BuildContext context) {
     return showDialog(
         context: context,
         barrierDismissible: false,
         builder: (BuildContext context) {
           return new AlertDialog(
             title: Text('Enter SMS Code'),
             content: Container(
               height: 85,
               child: Column(children: [
                 TextField(
                   onChanged: (value) {
                     this.smsOTP = value;
                   },
                 ),
                 (errorMessage != ''
                     ? Text(
                         errorMessage,
                         style: TextStyle(color: Colors.red),
                       )
                     : Container())
               ]),
            ),
             contentPadding: EdgeInsets.all(10),
            actions: <Widget>[
               FlatButton(
                 child: Text('Done'),
                 onPressed: () {
                    // _auth.currentUser.then((user) {
                    //  if (user != null) {
                    //    Navigator.of(context).pop();
                    //    Navigator.of(context).pushReplacementNamed('/homepage');
                    //  } else {
                    //    signIn();
                    //  }
                 // }
                  //);
                 },
               )
             ],
           );
         });
   }
   signIn() async {
     try {
       final AuthCredential credential = PhoneAuthProvider.credential(
         verificationId: verificationId,
         smsCode: smsOTP,
       );
      final User user= (await _auth.signInWithCredential(credential)).user;
       //final User user = await _auth.signInWithCredential(credential);
    final User currentUser =  _auth.currentUser;
       assert(user.uid == currentUser.uid);
       Navigator.of(context).pop();
       Navigator.of(context).pushReplacementNamed('/homepage');
     } catch (e) {
       handleError(e);
     }
   }
   handleError(PlatformException error) {
     print(error);
     switch (error.code) {
       case 'ERROR_INVALID_VERIFICATION_CODE':
         FocusScope.of(context).requestFocus(new FocusNode());
         setState(() {
           errorMessage = 'Invalid Code';
         });
         Navigator.of(context).pop();
         smsOTPDialog(context).then((value) {
           print('sign in');
         });
         break;
       default:
         setState(() {
           errorMessage = error.message;
         });
         break;
     }
   }
   @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: new Text("HouseKeeper's Friend", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Open Sans', fontWeight: FontWeight.bold)),
         leading: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Image.asset(
             "/houselogo.PNG",
             scale: 8.0,
           )
         )
       ),
       body: Center(
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.start,
           children: <Widget>[
 SizedBox(height: 40,),
             Container(
                   height: 150,
                   width: 200,
                   child: Image.asset('assets/housekeep.PNG')),
                   SizedBox(height: 22,),
             Padding(
               padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
               child: TextField(
                 decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(style: BorderStyle.solid, width: 2)),
                 enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(10)),
                     borderSide: BorderSide(color: Colors.black, width: 2)),
          
                
                 contentPadding: EdgeInsets.only(top: 14.0,left: 5.0, right: 5.0),
                 prefixIcon: Icon(
                   Icons.phone,
                   color: Colors.black,
                 ),
                     hintText: 'Enter Phone Number Eg. +910000000000'),
                 onChanged: (value) {
                   this.phoneNo = value;
                 },
               ),
             ),
             (errorMessage != ''
                 ? Text(
                     errorMessage,
                     style: TextStyle(color: Colors.red),
                   )
                 : Container()),
             SizedBox(
               height: 10,
             ),
             RaisedButton(
               onPressed: () {
                 verifyPhone();
               },
               child: Text('Verify'),
               textColor: Colors.white,
               elevation: 7,
               color: Colors.blue,
             )
           ],
         ),
       ),
     );
   }
 }
// // void main() => runApp(MyApp());

// // class MyApp extends StatefulWidget {
// //   // This widget is the root of your application.
 
// //   @override
// //   _MyAppState createState() => _MyAppState();
// // }

// // class _MyAppState extends State<MyApp> {
// //   Future<LocationData> _getUserLocation;
// //   LatLng _markerLocation;
// //   LatLng _userLocation;
// //   String resultAddress;
// //   @override
// //   void initState() {
// //     super.initState();
// //     _getUserLocation = getUserLocation();
// //   }

// //   Future<LocationData> getUserLocation() async {
// //     Location location = new Location();

// //     bool _serviceEnabled;
// //     PermissionStatus _permissionGranted;

// //     _serviceEnabled = await location.serviceEnabled();
// //     if (!_serviceEnabled) {
// //       _serviceEnabled = await location.requestService();
// //       if (!_serviceEnabled) {
// //         return null;
// //       }
// //     }

// //     _permissionGranted = await location.hasPermission();
// //     if (_permissionGranted == PermissionStatus.denied) {
// //       _permissionGranted = await location.requestPermission();
// //       if (_permissionGranted != PermissionStatus.granted) {
// //         return null;
// //       }
// //     }
// //     final result = await location.getLocation();
// //     _userLocation = LatLng(result.latitude, result.longitude);
// //     return result;
// //   }

// //   getSetAddress(Coordinates coordinates) async {
// //     final addresses =
// //         await Geocoder.local.findAddressesFromCoordinates(coordinates);
// //     setState(() {
// //       resultAddress = addresses.first.addressLine;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       //title: 'Flutter Demo',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text("Select Your Location",
// //               textAlign: TextAlign.center,
// //               style: TextStyle(
// //                   fontFamily: 'Open Sans', fontWeight: FontWeight.bold)),
// //           leading: Padding(
// //               padding: const EdgeInsets.all(8.0),
// //               child: Image.asset(
// //                 "assets/Growcerylogo100.png",
// //                 scale: 8.0,
// //               )),
// //           actions: [
// //             Stack(
// //               children: [
// //                 IconButton(
// //                   icon: Icon(
// //                     Icons.shopping_cart,
// //                     color: Colors.white,
// //                   ),
// //                   onPressed: () {
// //                     Route route = MaterialPageRoute(builder: (context) => null);
// //                     Navigator.pushReplacement(context, route);
// //                   },
// //                 ),
// //                 // IconButton(
// //                 //   icon: Icon(Icons.search, color: Colors.white),
// //                 // ),
// //               ],
// //             )
// //           ],
// //         ),
// //         body: SafeArea(
// //           child: Column(
// //             children: <Widget>[
// //               Expanded(
// //                 child: FutureBuilder<LocationData>(
// //                   future: _getUserLocation,
// //                   builder: (context, snapshot) {
// //                     switch (snapshot.hasData) {
// //                       case true:
// //                         return MyMap(
// //                           markerLocation: _markerLocation,
// //                           userLocation: _userLocation,
// //                           onTap: (location) {
// //                             setState(() {
// //                               _markerLocation = location;
// //                             });
// //                           },
// //                         );
// //                       default:
// //                         return Center(
// //                           child: CircularProgressIndicator(),
// //                         );
// //                     }
// //                   },
// //                 ),
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.all(8.0),
// //                 // child: Text(
// //                 //   // resultAddress ?? "Address will be shown here",
// //                 //   // style: Theme.of(context).textTheme.title,
// //                 // ),
// //               ),

             
// //               // SizedBox(
// //               //   width: double.infinity,
// //               //   child: RaisedButton(
// //               //     child: Text("Get My Location Address"),
// //               //     onPressed: () async {
// //               //       if (_userLocation != null) {
// //               //         getSetAddress(
// //               //           Coordinates(
// //               //             _userLocation.latitude,
// //               //             _userLocation.longitude,
// //               //           ),
// //               //         );
// //               //       }
// //               //     },
// //               //   ),
// //               // ),
// //               // SizedBox(
// //               //   width: double.infinity,
// //               //   child: RaisedButton(
// //               //     child: Text("Get Marker Address"),
// //               //     onPressed: () async {
// //               //       if (_markerLocation != null) {
// //               //         getSetAddress(
// //               //           Coordinates(
// //               //             _markerLocation.latitude,
// //               //             _markerLocation.longitude,
// //               //           ),
// //               //         );
// //               //       }

// //               //       // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home(resultAddress: resultAddress)));
// //               //     },
// //               //   ),
// //               // ),
// //               RaisedButton(
// //               color:Colors.blue,
// //               child: Text("Continue ",
              
// //               //textWidthBasis: TextWidthBasis.longestLine,
// //               style: TextStyle(fontWeight: FontWeight.w800, 
// //               fontSize: 20.0,color: Colors.white),),
// //               onPressed: (){},
// //               )
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class MyMap extends StatefulWidget {
// //   final markerLocation, userLocation, onTap;

// //   const MyMap({Key key, this.markerLocation, this.userLocation, this.onTap})
// //       : super(key: key);
// //   @override
// //   _MyMapState createState() => _MyMapState();
// // }

// // class _MyMapState extends State<MyMap> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return GoogleMap(
// //       initialCameraPosition: CameraPosition(
// //         target: widget.userLocation ?? LatLng(14, 20),
// //       ),
// //       myLocationEnabled: true,
// //       markers: widget.markerLocation != null
// //           ? [
// //               Marker(
// //                   markerId: MarkerId("Tap Location"),
// //                   position: widget.markerLocation),
// //             ].toSet()
// //           : null,
// //       onTap: widget.onTap,
// //     );
// //   }
// // }

// 

// import 'package:checklist/Authentication/homepage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:pinput/pin_put/pin_put.dart';

// class OTPScreens extends StatefulWidget {
//   final String phone;
//   OTPScreens(this.phone);
//   @override
//   _OTPScreenState createState() => _OTPScreenState();
// }

// class _OTPScreenState extends State<OTPScreens> {
//   final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
//   String _verificationCode;
//   final TextEditingController _pinPutController = TextEditingController();
//   final FocusNode _pinPutFocusNode = FocusNode();
//   final BoxDecoration pinPutDecoration = BoxDecoration(
//     color: const Color.fromRGBO(43, 46, 66, 1),
//     borderRadius: BorderRadius.circular(10.0),
//     border: Border.all(
//       color: const Color.fromRGBO(126, 203, 224, 1),
//     ),
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldkey,
//       appBar: AppBar(
//         title: Text('OTP Verification'),
//       ),
//       body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.only(top: 40),
//             child: Center(
//               child: Text(
//                 'Verify +91${widget.phone}',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(30.0),
//             child: PinPut(
//               fieldsCount: 6,
//               textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
//               eachFieldWidth: 40.0,
//               eachFieldHeight: 55.0,
//               focusNode: _pinPutFocusNode,
//               controller: _pinPutController,
//               submittedFieldDecoration: pinPutDecoration,
//               selectedFieldDecoration: pinPutDecoration,
//               followingFieldDecoration: pinPutDecoration,
//               pinAnimationType: PinAnimationType.fade,
//               onSubmit: (pin) async {
//                 try {
//                   await FirebaseAuth.instance
//                       .signInWithCredential(PhoneAuthProvider.credential(
//                           verificationId: _verificationCode, smsCode: pin))
//                       .then((value) async {
//                     if (value.user != null) {
//                       Navigator.pushAndRemoveUntil(
//                           context,
//                           MaterialPageRoute(builder: (context) => MyHome()),
//                           (route) => false);
//                     }
//                   });
//                 } catch (e) {
//                   FocusScope.of(context).unfocus();
//                   _scaffoldkey.currentState
//                       .showSnackBar(SnackBar(content: Text('invalid OTP')));
//                 }
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   _verifyPhone() async {
//     await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: '+91${widget.phone}',
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           await FirebaseAuth.instance
//               .signInWithCredential(credential)
//               .then((value) async {
//             if (value.user != null) {
//               Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(builder: (context) => MyHome()),
//                   (route) => false);
//             }
//           });
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           print(e.message);
//         },
//         codeSent: (String verficationID, int resendToken) {
//           setState(() {
//             _verificationCode = verficationID;
//           });
//         },
//         codeAutoRetrievalTimeout: (String verificationID) {
//           setState(() {
//             _verificationCode = verificationID;
//           });
//         },
//         timeout: Duration(seconds: 120));
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _verifyPhone();
//   }
// }