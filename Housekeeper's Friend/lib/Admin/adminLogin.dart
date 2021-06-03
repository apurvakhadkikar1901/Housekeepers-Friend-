import 'package:checklist/Admin/uploadItems.dart';
import 'package:checklist/Authentication/authentication.dart';
import 'package:checklist/DialogBox/errorDialog.dart';
import 'package:checklist/Widgets/customTextField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:e_shop/Admin/uploadItems.dart';
// import 'package:e_shop/Authentication/authenication.dart';
// import 'package:e_shop/Widgets/customTextField.dart';
// import 'package:e_shop/DialogBox/errorDialog.dart';
import 'package:flutter/material.dart';




class AdminSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace:Container(
            decoration: BoxDecoration(
              gradient: new LinearGradient(
                colors: [Colors.blue,Colors.blue[800]],
                begin: const FractionalOffset(0.0,0.0),
                end:const FractionalOffset(1.0,0.0),
                stops:[0.0,1.0],
                tileMode: TileMode.clamp,
                )
                ),
                ) ,
                title: Text("Housekeeper's Friend",
                  style: TextStyle(fontSize:25.0,color:Colors.white,fontFamily: "Signatra")),
                centerTitle: true,
      ),
    body: AdminSignInScreen(

    ),
    );
  }
}


class AdminSignInScreen extends StatefulWidget {
  @override
  _AdminSignInScreenState createState() => _AdminSignInScreenState();
}

class _AdminSignInScreenState extends State<AdminSignInScreen>
{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _adminIDTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  double _screenWidth;
  //error janya sathi error yet hota _screenWidth la la
  
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        
            // decoration: BoxDecoration(
            //   gradient: new LinearGradient(
            //     colors: [Colors.blue,Colors.lightBlue],
            //     begin: const FractionalOffset(0.0,0.0),
            //     end:const FractionalOffset(1.0,0.0),
            //     stops:[0.0,1.0],
            //     tileMode: TileMode.clamp,
            //     )
            //     ),
                
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // Container(
            //   alignment:Alignment.bottomCenter,
            //   child: Image.asset(
            //     "images/admin.png",
            //     height: 240.0,
            //     width: 240.0,
            //   ),
            // ),
            SizedBox(height: 80.0,),
            Padding(
              
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Admin",
                style: TextStyle(color: Colors.blue[600],fontSize: 28.0,fontWeight: FontWeight.bold),

              ),
            ),
            SizedBox(height: 30.0,),
            Form(
              key: _formKey,
              child: Column(
                children: [
                 
                  CustomTextField(
                    controller: _adminIDTextEditingController,
                    data: Icons.person,
                    hintText: "id",
                    isObsecure: false,
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
              height: 30.0,),

            RaisedButton(
              onPressed: () {
                _adminIDTextEditingController.text.isNotEmpty &&_passwordTextEditingController.text.isNotEmpty? loginAdmin():showDialog(
                  context: context,
                  builder:(context){
                    return ErrorAlertDialog(message: "please write email and password",);
                  }
                );
                
                //uploadAndSaveImage(context);
              },
              color: Colors.blue[800],
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              height: 4.0,
              width: _screenWidth = 0.8,
              color: Colors.white,
            ),
            SizedBox(
              height: 10.0,
            ),
            FlatButton.icon(
              onPressed: ()=> Navigator.push(context,MaterialPageRoute(builder: (context) =>AuthenticScreen())),
              icon:(Icon(Icons.nature_people,color:Colors.blue[800],)),
              label: Text("i am not Admin",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),

            ),
            SizedBox(
              height: 50.0,),

          ],
        ),alignment: Alignment.bottomCenter,
      ),
    );
  }

  loginAdmin() {

    FirebaseFirestore.instance.collection("admins").get().then((snapshot){
      snapshot.docs.forEach((result){
        if(result["id"] != _adminIDTextEditingController.text.trim()){
          
          Scaffold.of(context).showSnackBar(SnackBar(content: Text("your id is not correct"),));


        }else if(result["password"] != _passwordTextEditingController.text.trim()){
          

           Scaffold.of(context).showSnackBar(SnackBar(content: Text("your password is not correct"),));

        }else{
           Scaffold.of(context).showSnackBar(SnackBar(content: Text("Welcome Admin"+ result['name']),));
          setState(() {
                      _adminIDTextEditingController.text ="";
                      _passwordTextEditingController.text="";
                    });
          Route route= MaterialPageRoute(builder: (context) =>UploadPage());
          Navigator.pushReplacement(context,route);

     
        
        
        }
      });
    });

  }
}
