
import 'package:flutter/material.dart';
import 'package:zometo/Pages/Sign_up.dart';
import 'package:zometo/Widgets/Support_widget.dart';
import 'package:zometo/Widgets/content_model.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentState = 0;
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentState = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: EdgeInsets.only(top:40,left:20,right: 20),
                    child: Column(
                      children: [
                        Image.asset(
                          contents[i].image,
                          height: 450,
                          width: MediaQuery.of(context).size.width / 1.5,
                          fit: BoxFit.cover,
                        ),
                       SizedBox(height:40 ,),
                        Text(contents[i].Title,style: Appwidget.HeaderfieldTextStyle(),),
                        SizedBox(height: 40,),
                        Text(contents[i].Description,style: Appwidget.lightfieldTextStyle(),)
                      ],
                    ),
                  );
                }),
          ),
          Container(
            child: Row(
              mainAxisAlignment:MainAxisAlignment.center ,
              children:
                List.generate(contents.length, (index)=> buildDot(index,context))
              ,
            ),
          ),
          GestureDetector(
            onTap: (){
              if(currentState==contents.length-1){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Sign_up()));
              }
              _controller.nextPage(duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30)
              ),
              height: 60,
              margin: EdgeInsets.all(40),
              width: double.infinity,
              child: Center(child: Text(currentState==contents.length-1?"Start":"Next",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30,fontFamily: "Poppins"),)),
            ),
          )
        ],
      ),
    );
  }
  Container buildDot(int index,BuildContext context){
    return Container(
      height: 10,
      width: currentState==index?18:7,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.black38,
      ),
    );
  }
}
