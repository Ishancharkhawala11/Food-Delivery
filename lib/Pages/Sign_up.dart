import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:zometo/Pages/BottomNav.dart';
import 'package:zometo/Pages/Home.dart';
import 'package:zometo/Pages/Login.dart';
import 'package:zometo/service/database.dart';

import '../Widgets/Support_widget.dart';
import '../service/Shred_prefernce.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({super.key});

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  String name = "", email = "", password = "";
  TextEditingController Name = new TextEditingController();
  TextEditingController Email = new TextEditingController();
  TextEditingController Password = new TextEditingController();
  final _formKey=GlobalKey<FormState>();
  registration() async {
    if (Password != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
          "Registered Succesfully",
          style: TextStyle(
            fontSize: 20,
          ),
        )));
        String id=randomAlphaNumeric(10);
        Map<String,dynamic> addUserInfo={
          "Name":Name.text,
          "Email":Email.text,
          "Wallet":"0",
          "Id":id,
        };
        await databaseMethods().addUserDetails(addUserInfo, id);
        await shared_pref_method().saveUserName(Name.text);
        await shared_pref_method().saveUserEmail(Email.text);
        await shared_pref_method().saveUserId(id);
        await shared_pref_method().saveUserWallet("0");
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNav()));
      } on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
            "Pasword Provided is too weak",
            style: TextStyle(
              fontSize: 20,
            ),
          )));
        }
        else if(e.code=="email-already-in-use"){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account is Already exist",
                style: TextStyle(
                  fontSize: 20,
                ),
              )));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFff5c30), Color(0xFFe74b1a)])),
            ),
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              height: MediaQuery.of(context).size.height ,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: const Text(""),
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 50, right: 20, left: 20),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        "Images/logo.png",
                        width: MediaQuery.of(context).size.width / 1.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        height: MediaQuery.of(context).size.height / 2.2,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Sign up",
                                style: Appwidget.HeaderfieldTextStyle(),
                              ),
                              TextFormField(
                                controller: Name,
                                validator:(value){
                                  if(value==null ||value.isEmpty)
                                    {
                                      return "Please enter Name here";
                                    }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: "Name",
                                    hintStyle: Appwidget.SemifieldTextStyle(),
                                    prefixIcon: Icon(Icons.person_outline)),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                controller: Email,
                                validator:(value){
                                  if(value==null ||value.isEmpty)
                                  {
                                    return "Please enter Email here";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    hintStyle: Appwidget.SemifieldTextStyle(),
                                    prefixIcon: Icon(Icons.email_outlined)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: Password,
                                validator:(value){
                                  if(value==null ||value.isEmpty)
                                  {
                                    return "Please enter Password here";
                                  }
                                  return null;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: Appwidget.SemifieldTextStyle(),
                                    prefixIcon: Icon(Icons.password_outlined)),
                              ),
                              SizedBox(
                                height: 60,
                              ),
                              GestureDetector(
                                onTap:(){
                                  if(_formKey.currentState!.validate()){
                                    setState(() {
                                      email=Email.text;
                                      name=Name.text;
                                      password=Password.text;
                                    });
              
                                  }
                                  registration();
                                },
                                child: Material(
                                  borderRadius: BorderRadius.circular(20),
                                  elevation: 5,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    width: 200,
                                    decoration: BoxDecoration(
                                        color: Color(0Xffff5722),
                                        borderRadius: BorderRadius.circular(20)),
                                    child: Center(
                                        child: Text(
                                      "SignUp",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
                        "Already have a account?Log in",
                        style: Appwidget.BoldfieldTextStyle(),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
