// import 'package:e_shop/Admin/adminLogin.dart';
// import 'package:e_shop/Widgets/customTextField.dart';
// import 'package:e_shop/DialogBox/errorDialog.dart';
// import 'package:e_shop/DialogBox/loadingDialog.dart';
import 'package:checklist/Admin/adminLogin.dart';
import 'package:checklist/DialogBox/errorDialog.dart';
import 'package:checklist/DialogBox/loadingDialog.dart';
import 'package:checklist/Vendors/electricianfom.dart';
//import 'package:checklist/Vendors/maidForm.dart';
import 'package:checklist/Vendors/maidhome.dart';
//import 'package:checklist/Vendors/main1.dart';
//import 'package:checklist/Vendors/plumber.dart';
//import 'package:checklist/Vendors/plumberform.dart';
import 'package:checklist/Vendors/plumberhome.dart';
import 'package:checklist/Vendors/technician/technicianfom.dart';
import 'package:checklist/Vendors/technician/technicianhome.dart';
import 'package:checklist/Vendors/technicianform.dart';
import 'package:checklist/Widgets/customTextField.dart';
import 'package:checklist/screens/login_screen/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import '../Store/storehome.dart';
import 'package:checklist/Config/config.dart';
import 'electrician/electricianhome.dart';
import 'maidhome.dart';

class VendorLogin extends StatefulWidget {
  @override
  _VendorLoginState createState() => _VendorLoginState();
}





class _VendorLoginState extends State<VendorLogin>
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                                child: Image(
                                  image: AssetImage(
                                    'images/h1.PNG',
                                  ),
                                  height: 300.0,
                                  width: 300.0,
                                ),
                              ),
              //SizedBox(height: 10.0,),

              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  "Log In as User",
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
                    CustomTextField(
                      controller: _emailTextEditingController,
                      data: Icons.email,
                      hintText: "Email",
                      isObsecure: false,
                      style:TextStyle(color: Colors.white),
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
                color: Colors.blue[800],
                   
                child: Text(
                  "Login as User",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            SizedBox(
                height: 50.0,
              ),



              
              
              
              Container(
                // height: 4.0,
                // width: _screenWidth = 0.8,
                //color: Colors.blue[800],
              decoration: BoxDecoration(
              color: Colors.blue[600],
              borderRadius: BorderRadius.all(Radius.circular(50.0))),
                
              ),
              SizedBox(
                height: 10.0,
              ),
              // FlatButton.icon(
              //   onPressed: ()=> Navigator.push(context,MaterialPageRoute(builder: (context) =>AdminSignInPage())),
              //   icon:(Icon(Icons.nature_people,color:Colors.blue,)),
              //   label: Text("i am Admin",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),
              //   ),

              // ),

              // addig link for te vendr page 
              
              FlatButton.icon(
                onPressed: ()=> Navigator.push(context,MaterialPageRoute(builder: (context) =>LoginScreen())),
                icon:(Icon(Icons.nature_people,color:Colors.blue,)),
                label: Text("i am a Vendor",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),
                ),

              ),
              // .............
              

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
        Route route= MaterialPageRoute(builder: (context) =>MyAppp());
        Navigator.pushReplacement(context,route);
      }
      );
    }
      
    
  }
Future readData(User user) async{
   FirebaseFirestore.instance.collection("vendors").doc(user.uid).get().then((dataSnapshot) 
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

class MyAppp extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.blue[600],
        title: Text("DashBoard",),
        
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: 
                  new MaterialButton(
                    height: 180.0,
                    minWidth: 160.0,
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    child:new Column(
                      mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Image.asset('images/maid.png',
                              height: 60.0, width: 50.0),
                          Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: new Text(
                                "Maid  ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ))
                        ],
                    ),
                    //child: new Text("maid",),
                    
                    onPressed: () => {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StoreHomes()),
                    )
                    },
                    
                    splashColor: Colors.redAccent,
                  )),
              Padding(
                
                  padding: EdgeInsets.all(10.0),
                  child: new MaterialButton(
                    height: 180.0,
                    minWidth: 160.0,
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    child:new Column(
                      mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Image.asset('images/electrician.png',
                              height: 60.0, width: 50.0),
                          Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: new Text(
                                "Electrician  ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ))
                        ],
                    ),
                    //child: new Text("electrician"),
                    onPressed: () => {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => electricianh()),
                    )
                    },
                    splashColor: Colors.redAccent,
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: new MaterialButton(
                    height: 180.0,
                    minWidth: 160.0,
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    child:new Column(
                      mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Image.asset('images/technician.png',
                              height: 60.0, width: 50.0),
                          Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: new Text(
                                "Technician ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ))
                        ],
                    ),
                    //child: new Text("technician"),
                    onPressed: () => {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => technician()),
                    )
                    },
                    splashColor: Colors.redAccent,
                  )),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: new MaterialButton(
                    height: 180.0,
                    minWidth: 160.0,
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                   // child: new Text("plumber"),
                    child:new Column(
                      mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Image.asset('images/plumber.jpg',
                              height: 60.0, width: 50.0),
                          Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: new Text(
                                "Plumber  ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ))
                        ],
                    ),
                    onPressed: () => {
                    Navigator.push(

                    context,
                    MaterialPageRoute(builder: (context) => StoreHomesp()),
                    )
                    },
                    splashColor: Colors.redAccent,
                  )),
            ],
          ),

        ],
      )),
    );
  }
}

  

   
