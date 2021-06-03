// import 'package:e_shop/Admin/adminLogin.dart';
// import 'package:e_shop/Widgets/customTextField.dart';
// import 'package:e_shop/DialogBox/errorDialog.dart';
// import 'package:e_shop/DialogBox/loadingDialog.dart';
import 'package:checklist/Admin/adminLogin.dart';
import 'package:checklist/DialogBox/errorDialog.dart';
import 'package:checklist/DialogBox/loadingDialog.dart';
//import 'package:checklist/Vendors/main1.dart';
import 'package:checklist/Vendors/vendorAuthentication.dart';
import 'package:checklist/Widgets/customTextField.dart';
import 'package:checklist/screens/login_screen/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Store/storehome.dart';
import 'package:checklist/Config/config.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}





class _LoginState extends State<Login>
{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width,
        _screenHeight = MediaQuery.of(context)
            .size
            .height; // used to make the site responsive
  
    return Scaffold(
          body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 30.0,),

              Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  "Log In",
                  style: TextStyle(color: Colors.blue[600],fontSize: 28.0,fontWeight: FontWeight.bold),

                ),
              ),
              // Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: Text(
              //     "Login to your account",
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ),
              Form(
                key: _formKey,
                child: Column(
                
                  children: [
                    Container(
                      
                      child: new CustomTextField(
                        controller: _emailTextEditingController,
                        data: Icons.email,
                        hintText: "Email",
                        isObsecure: false,
                        style:TextStyle(color: Colors.white),
                      ),
                      
                    ),
                    CustomTextField(
                      
                      controller: _passwordTextEditingController,
                      data: Icons.person,
                      hintText: "Password",
                      isObsecure: true,


                      
                    ),
                    
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              RaisedButton(
                
                onPressed: () {
                  _emailTextEditingController.text.isNotEmpty &&_passwordTextEditingController.text.isNotEmpty? loginUser():showDialog(
                    context: context,
                    builder:(c){
                      return ErrorAlertDialog(message: "please write email and password",);
                      
                    }
                  );
                  
                  //uploadAndSaveImage(context);
                },
              //  color: Colors.blue[800],
                   
                child: Text(
                  "Login",
                  style:  TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0,color: Colors.black),
                ),
              ),
            SizedBox(
                height: 30.0,
              ),

              
              Container(
                // height: 4.0,
                // width: _screenWidth = 0.8,
                //color: Colors.blue[800],
              
                
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton.icon(
                onPressed: ()=> Navigator.push(context,MaterialPageRoute(builder: (context) =>AdminSignInPage())),
                icon:(Icon(Icons.nature_people,color:Colors.blue,)),
                label: Text("i am Admin",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),
                ),

              ),

              // addig link for te vendr page 
              
              FlatButton.icon(
                onPressed: ()=> Navigator.push(context,MaterialPageRoute(builder: (context) =>LoginScreen())),
                icon:(Icon(Icons.nature_people,color:Colors.blue,)),
                label: Text("i am Vendor",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),
                ),

              ),
              // .............
              FlatButton.icon(
                onPressed: ()=> Navigator.push(context,MaterialPageRoute(builder: (context) =>VendorAuthenticScreen())),
                icon:(Icon(Icons.nature_people,color:Colors.blue,)),
                label: Text("i am User",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),
                ),

              ),

            ],
          ),alignment: Alignment.bottomCenter,
        ),
      ),
    );
  }
  Future<void> loginUser() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    showDialog(
      context: context,
      builder: (c){
        return LoadingAlertDialog(message: "Authentication, Please wait...",);
      }
    );
    User firebaseUser;
    await _auth.signInWithEmailAndPassword(
      email: _emailTextEditingController.text.trim(),
      password: _passwordTextEditingController.text.trim(),
    ).then((authUser){
      firebaseUser = authUser.user;
    }
    ).catchError((error)
    {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context){
          return ErrorAlertDialog(message: error.message.toString(),);
        });
    });

    if(firebaseUser !=null)
    {
      readData(firebaseUser).then((s){
        Navigator.pop(context);
        //Navigator.pop(context);
        Route route= MaterialPageRoute(builder: (context) =>StoreHome());
        Navigator.pushReplacement(context,route);
      }
      );
    }
      
    
  }
Future readData(User user) async{
   FirebaseFirestore.instance.collection("users").doc(user.uid).get().then((dataSnapshot) 
   async {
    await EcommerceApp.sharedPreferences.setString("uid",dataSnapshot[EcommerceApp.userUID]);
    await EcommerceApp.sharedPreferences.setString(EcommerceApp.userEmail,dataSnapshot[EcommerceApp.userEmail]);
    //snapshot.data[EcommerceApp.userEmail]);
    await EcommerceApp.sharedPreferences.setString(EcommerceApp.userName,dataSnapshot[EcommerceApp.userName]);
    //await EcommerceApp.sharedPreferences.setString(EcommerceApp.userAvatarUrl,userImageUrl);
    List<String> cartList = dataSnapshot[EcommerceApp.userCartList].cast<String>();
    await EcommerceApp.sharedPreferences.setStringList(EcommerceApp.userCartList,cartList);

   });



}

}


  

   
