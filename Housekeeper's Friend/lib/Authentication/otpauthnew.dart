// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/services.dart';
// import 'homepage.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Phone Authentication',
//       routes: <String, WidgetBuilder>{
//         '/homepage': (BuildContext context) => MyHome(),
//         '/loginpage': (BuildContext context) => MyApp(),
//       },
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyAppPage(title: 'Grocery'),
//     );
//   }
// }

// class MyAppPage extends StatefulWidget {
//   MyAppPage({Key key, this.title}) : super(key: key);
//   final String title;

//   @override
//   _MyAppPageState createState() => _MyAppPageState();
// }

// class _MyAppPageState extends State<MyAppPage> {
//   String phoneNo;
//   String smsOTP;
//   String verificationId;
//   String errorMessage = '';
//   FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<void> verifyPhone() async {
//     final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
//       this.verificationId = verId;
//       smsOTPDialog(context).then((value) {
//         print('sign in');
//       });
//     };
//     try {
//       await _auth.verifyPhoneNumber(
//           phoneNumber: this.phoneNo, // PHONE NUMBER TO SEND OTP
//           codeAutoRetrievalTimeout: (String verId) {
//             //Starts the phone number verification process for the given phone number.
//             //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
//             this.verificationId = verId;
//           },
//           codeSent:
//               smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
//           timeout: const Duration(seconds: 20),
//           verificationCompleted: (AuthCredential phoneAuthCredential) {
//             print(phoneAuthCredential);
//           },
//           verificationFailed: ( exceptio) {
//             print('${exceptio.message}');
//           });
//     } catch (e) {
//       handleError(e);
//     }
//   }

//   Future<bool> smsOTPDialog(BuildContext context) {
//     return showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return new AlertDialog(
//             title: Text('Enter SMS Code'),
//             content: Container(
//               height: 85,
//               child: Column(children: [
//                 TextField(
//                   onChanged: (value) {
//                     this.smsOTP = value;
//                   },
//                 ),
//                 (errorMessage != ''
//                     ? Text(
//                         errorMessage,
//                         style: TextStyle(color: Colors.red),
//                       )
//                     : Container())
//               ]),
//             ),
//             contentPadding: EdgeInsets.all(10),
//             actions: <Widget>[
//               // FlatButton(
//               //   child: Text('Done'),
//               //   onPressed: () {
//               //     _auth.currentUser().then((user) {
//               //       if (user != null) {
//               //         Navigator.of(context).pop();
//               //         Navigator.of(context).pushReplacementNamed('/homepage');
//               //       } else {
//               //         signIn();
//               //       }
//               //     });
//               //   },
//               // )
//             ],
//           );
//         });
//   }

//   signIn() async {
//     try {
//       final AuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: verificationId,
//         smsCode: smsOTP,
//       );
//       //final User user =  (_auth.signInWithCredential(credential)).user;
//       final User currentUser =  _auth.currentUser;
//      // assert(user.uid == currentUser.uid);
//       Navigator.of(context).pop();
//       Navigator.of(context).pushReplacementNamed('/homepage');
//     } catch (e) {
//       handleError(e);
//     }
//   }

//   handleError(PlatformException error) {
//     print(error);
//     switch (error.code) {
//       case 'ERROR_INVALID_VERIFICATION_CODE':
//         FocusScope.of(context).requestFocus(new FocusNode());
//         setState(() {
//           errorMessage = 'Invalid Code';
//         });
//         Navigator.of(context).pop();
//         smsOTPDialog(context).then((value) {
//           print('sign in');
//         });
//         break;
//       default:
//         setState(() {
//           errorMessage = error.message;
//         });

//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: new Text("HouseKeeper's Friend", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Open Sans', fontWeight: FontWeight.bold)),
//         leading: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Image.asset(
//             "assets/houselogo.PNG",
//             scale: 8.0,
//           )
//         )
//       ),
//       body: Center(
//         child: Column(
//          crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
// SizedBox(height: 40,),
//             Container(
//                   height: 150,
//                   width: 200,
//                   child: Image.asset('assets/housekeep.PNG')),

//                   SizedBox(height: 22,),
//             Padding(
//               padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
//               child: TextField(
//                 decoration: InputDecoration(
//                    focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(style: BorderStyle.solid, width: 2)),
//                 enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     borderSide: BorderSide(color: Colors.black, width: 2)),

           
                
//                 contentPadding: EdgeInsets.only(top: 14.0,left: 5.0, right: 5.0),
//                 prefixIcon: Icon(
//                   Icons.phone,
//                   color: Colors.black,
//                 ),
//                     hintText: 'Enter Phone Number Eg. +910000000000'),
//                 onChanged: (value) {
//                   this.phoneNo = value;
//                 },
//               ),
//             ),
//             (errorMessage != ''
//                 ? Text(
//                     errorMessage,
//                     style: TextStyle(color: Colors.red),
//                   )
//                 : Container()),
//             SizedBox(
//               height: 10,
//             ),
//             RaisedButton(
//               onPressed: () {
//                 verifyPhone();
//               },
//               child: Text('Verify'),
//               textColor: Colors.white,
//               elevation: 7,
//               color: Colors.blue,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }



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


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyAppa());
}

class MyAppa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Phone Auth Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Phone Authentication'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  User _firebaseUser;
  String _status;

  AuthCredential _phoneAuthCredential;
  String _verificationId;
  int _code;

  @override
  void initState() {
    super.initState();
    _getFirebaseUser();
  }

  void _handleError(e) {
    print(e.message);
    setState(() {
      _status += e.message + '\n';
    });
  }

  Future<void> _getFirebaseUser() async {
    this._firebaseUser = await FirebaseAuth.instance.currentUser;
    setState(() {
      _status =
          (_firebaseUser == null) ? 'Not Logged In\n' : 'Already LoggedIn\n';
    });
  }

  /// phoneAuthentication works this way:
  ///     AuthCredential is the only thing that is used to authenticate the user
  ///     OTP is only used to get AuthCrendential after which we need to authenticate with that AuthCredential
  ///
  /// 1. User gives the phoneNumber
  /// 2. Firebase sends OTP if no errors occur
  /// 3. If the phoneNumber is not in the device running the app
  ///       We have to first ask the OTP and get `AuthCredential`(`_phoneAuthCredential`)
  ///       Next we can use that `AuthCredential` to signIn
  ///    Else if user provided SIM phoneNumber is in the device running the app,
  ///       We can signIn without the OTP.
  ///       because the `verificationCompleted` callback gives the `AuthCredential`(`_phoneAuthCredential`) needed to signIn
  Future<void> _login() async {
    /// This method is used to login the user
    /// `AuthCredential`(`_phoneAuthCredential`) is needed for the signIn method
    /// After the signIn method from `AuthResult` we can get `FirebaserUser`(`_firebaseUser`)
    try {
      await FirebaseAuth.instance
          .signInWithCredential(this._phoneAuthCredential)
          .then((UserCredential authRes) {
        _firebaseUser = authRes.user;
        print(_firebaseUser.toString());
      }).catchError((e) => _handleError(e));
      setState(() {
        _status += 'Signed In\n';
      });
    } catch (e) {
      _handleError(e);
    }
  }

  Future<void> _logout() async {
    /// Method to Logout the `FirebaseUser` (`_firebaseUser`)
    try {
      // signout code
      await FirebaseAuth.instance.signOut();
      _firebaseUser = null;
      setState(() {
        _status += 'Signed out\n';
      });
    } catch (e) {
      _handleError(e);
    }
  }

  Future<void> _submitPhoneNumber() async {
    /// NOTE: Either append your phone number country code or add in the code itself
    /// Since I'm in India we use "+91 " as prefix `phoneNumber`
    String phoneNumber = "+91 " + _phoneNumberController.text.toString().trim();
    print(phoneNumber);

    /// The below functions are the callbacks, separated so as to make code more redable
    void verificationCompleted(AuthCredential phoneAuthCredential) {
      print('verificationCompleted');
      setState(() {
        _status += 'verificationCompleted\n';
      });
      this._phoneAuthCredential = phoneAuthCredential;
      print(phoneAuthCredential);
    }

    void verificationFailed(FirebaseAuthException error) {
      print('verificationFailed');
      _handleError(error);
    }

    void codeSent(String verificationId, [int code]) {
      print('codeSent');
      this._verificationId = verificationId;
      print(verificationId);
      this._code = code;
      print(code.toString());
      setState(() {
        _status += 'Code Sent\n';
      });
    }

    void codeAutoRetrievalTimeout(String verificationId) {
      print('codeAutoRetrievalTimeout');
      setState(() {
        _status += 'codeAutoRetrievalTimeout\n';
      });
      print(verificationId);
    }

    await FirebaseAuth.instance.verifyPhoneNumber(
      /// Make sure to prefix with your country code
      phoneNumber: phoneNumber,

      /// `seconds` didn't work. The underlying implementation code only reads in `millisenconds`
      timeout: Duration(milliseconds: 10000),

      /// If the SIM (with phoneNumber) is in the current device this function is called.
      /// This function gives `AuthCredential`. Moreover `login` function can be called from this callback
      /// When this function is called there is no need to enter the OTP, you can click on Login button to sigin directly as the device is now verified
      verificationCompleted: verificationCompleted,

      /// Called when the verification is failed
      verificationFailed: verificationFailed,

      /// This is called after the OTP is sent. Gives a `verificationId` and `code`
      codeSent: codeSent,

      /// After automatic code retrival `tmeout` this function is called
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    ); // All the callbacks are above
  }

  void _submitOTP() {
    /// get the `smsCode` from the user
    String smsCode = _otpController.text.toString().trim();

    /// when used different phoneNumber other than the current (running) device
    /// we need to use OTP to get `phoneAuthCredential` which is inturn used to signIn/login
    this._phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: this._verificationId, smsCode: smsCode);

    _login();
  }

  void _reset() {
    _phoneNumberController.clear();
    _otpController.clear();
    setState(() {
      _status = "";
    });
  }

  void _displayUser() {
    setState(() {
      _status += _firebaseUser.toString() + '\n';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          GestureDetector(
            child: Icon(Icons.refresh),
            onTap: _reset,
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 24),
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: TextField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Spacer(),
              Expanded(
                flex: 1,
                child: MaterialButton(
                  onPressed: _submitPhoneNumber,
                  child: Text('Submit'),
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 48),
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: TextField(
                  controller: _otpController,
                  decoration: InputDecoration(
                    hintText: 'OTP',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Spacer(),
              Expanded(
                flex: 1,
                child: MaterialButton(
                  onPressed: _submitOTP,
                  child: Text('Submit'),
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 48),
          Text('$_status'),
          SizedBox(height: 48),
          MaterialButton(
            onPressed: _login,
            child: Text('Login'),
            color: Theme.of(context).accentColor,
          ),
          SizedBox(height: 24),
          MaterialButton(
            onPressed: _logout,
            child: Text('Logout'),
            color: Theme.of(context).accentColor,
          ),
          SizedBox(height: 24),
          MaterialButton(
            onPressed: _displayUser,
            child: Text('FirebaseUser'),
            color: Theme.of(context).accentColor,
          )
        ],
      ),
    );
  }
}