import 'package:flutter/material.dart';
import 'package:zometo/Pages/Sign_up.dart';
import 'package:zometo/Widgets/Support_widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: const Text(""),
            ),
            Container(
              margin: EdgeInsets.only(top: 50,right: 20,left: 20),
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      "Images/logo.png",
                      width: MediaQuery.of(context).size.width / 1.5,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 50,),
                  Material(
                    elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.only(left: 20,right: 20),
                       height: MediaQuery.of(context).size.height/2.2,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child:Column(
                        children: [
                          SizedBox(height: 30,),
                          Text("LogIn",style:Appwidget.HeaderfieldTextStyle() ,),
                          TextField(
                            decoration: InputDecoration(
                             hintText: "Email",
                              hintStyle:Appwidget.SemifieldTextStyle(),
                              prefixIcon: Icon(Icons.email_outlined)
                            ),
                          ),
                          SizedBox(height: 30,),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle:Appwidget.SemifieldTextStyle(),
                            prefixIcon: Icon(Icons.password_outlined)
                        ),
                      ),
                          SizedBox(height: 20,),
                          Container(
                              alignment: Alignment.topRight,
                              child: Text("Forget Password?",style: Appwidget.SemifieldTextStyle(),),),
                          SizedBox(height: 80,),
                          Material(
                            borderRadius: BorderRadius.circular(20),
                            elevation: 5,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              width:200 ,
                              decoration: BoxDecoration(
                                color: Color(0Xffff5722),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Center(child: Text("LOGIN",style: TextStyle(color:Colors.white,fontSize: 18,fontFamily: "Poppins" ,fontWeight: FontWeight.bold),)),
                            ),
                          ),

                        ],
                      ) ,
                    ),
                  ),
                  SizedBox(height: 70,),
                  GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Sign_up()));
                      },
                      child: Text("Don't have an account?Sign Up",style: Appwidget.BoldfieldTextStyle(),))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
