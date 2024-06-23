import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:zometo/Pages/Sign_up.dart";

class Forgot_Pass extends StatefulWidget {
  const Forgot_Pass({super.key});
  @override
  State<Forgot_Pass> createState() => _Forgot_PassState();
}

class _Forgot_PassState extends State<Forgot_Pass> {
  TextEditingController Email = new TextEditingController();
  String email="";
  resetPass()async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password Reset Email has been sent!",style: TextStyle(fontSize: 18),)));
    }on FirebaseAuthException catch(e){
      if(e.code=="user-not-found"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User not Found",style: TextStyle(fontSize: 18),)));
      }
    }
  }
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                "Password Recovery",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Enter the Mail",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: Form(
                  key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white70, width: 2),
                          borderRadius: BorderRadius.circular(30)),
                      child: TextFormField(
                        controller: Email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Email";
                          }
                          return null;
                        },
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                            hintStyle:
                                TextStyle(fontSize: 18, color: Colors.white),
                            hintText: "Email",
                            prefixIcon: Icon(Icons.person,
                                size: 30, color: Colors.white),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    GestureDetector(
                      onTap: (){
                        if(_formKey.currentState!.validate()){
                              setState(() {
                                email=Email.text;
                              });
                        }
                        resetPass();
                      },
                      child: Container(
                        width: 140,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Send Email",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        Text(
                          "Don't have an Account?",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Sign_up()));
                          },
                          child: Text(
                            "Create",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 184, 166, 6),
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )),


          ],
        ),
      ),
    );
  }
}
