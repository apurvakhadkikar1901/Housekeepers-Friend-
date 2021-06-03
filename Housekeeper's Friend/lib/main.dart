import 'dart:async';
//import 'package:checklist/Authentication/login.dart';
//import 'package:checklist/Authentication/loginscreenOTP.dart';
//import 'package:checklist/Authentication/otpAuth.dart';
import 'package:checklist/Vendors/main1.dart';
import 'package:checklist/screen/onboarding_screen.dart';
import 'package:checklist/screens/home_screen/home_screen.dart';
import 'package:checklist/screens/otp_screen/otp_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:e_shop/Counters/BookQuantity.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:checklist/Authentication/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Config/config.dart';
import 'Store/storehome.dart';
//import 'Vendors/vendorLogin.dart';
import 'Vendors/main1.dart';
// import 'package:e_shop/Config/config.dart';
// import 'Counters/cartitemcounter.dart';
// import 'Counters/changeAddresss.dart';
// import 'Counters/totalMoney.dart';
// import 'Store/storehome.dart';

Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  EcommerceApp.auth = FirebaseAuth.instance;
  //EcommerceApp.firestore= Firebase.instance;
  EcommerceApp.sharedPreferences= await SharedPreferences.getInstance();
  
  //var instance;
  EcommerceApp.firestore = FirebaseFirestore.instance;
  //FirebaseStorage.instance;


 // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            //title: 'e-Shop',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.green,
            ),
            home: SplashScreen(),
            routes: <String, WidgetBuilder>{
        '/otpScreen': (BuildContext ctx) => OtpScreen(),
        '/homeScreen': (BuildContext ctx) => HomeScreen(),
       // '/myAppp':(BuildContext ctx) => 
      '/myApp':(BuildContext ctx) => MyAppp(),
      },

    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen>
{
 @override
 void initState(){
   super.initState();



   displaySplash();
 }
 
 displaySplash() {

   Timer(Duration(seconds: 3),() async{
     if (await EcommerceApp.auth.currentUser != null){
       Route route =MaterialPageRoute(builder: (_)=> StoreHome());
       Navigator.pushReplacement(context,route);
     }
     else
     {
       Route route =MaterialPageRoute(builder: (_)=>OnboardingScreen());
       Navigator.pushReplacement(context,route);

     }


   });
}
  @override

  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: new BoxDecoration(
          gradient:new LinearGradient(
            colors:[Colors.white,Colors.white],
            begin: const FractionalOffset(0.0,0.0),
            end:  const FractionalOffset(1.0,0.0),
            stops: [0.0,1.0],
            tileMode:TileMode.clamp,
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              Image.asset("images/housekeep.PNG"),
              SizedBox(height:20.0,),
              Text("HouseKeeper's Friend",
              style: TextStyle(color: Colors.blue[800]),)

            ],),),
      ),
    );
  }
}