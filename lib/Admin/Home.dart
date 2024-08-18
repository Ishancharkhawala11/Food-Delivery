import 'package:flutter/material.dart';
import 'package:zometo/Admin/Add_food.dart';
import 'package:zometo/Widgets/Support_widget.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin:EdgeInsets.only(top: 50,left:20 ,right: 20 ) ,
        child: Column(
          children: [
            Center(
              child: Text("Home Admin",style: Appwidget.HeaderfieldTextStyle(),),
            ),
           SizedBox(height: 50,),
           GestureDetector(
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Add_food()));
             },
             child: Material(
               elevation: 10,
               borderRadius:BorderRadius.circular(10) ,
               child: Center(
                 child: Container(
                   padding: EdgeInsets.all(4),
                   decoration: BoxDecoration(
                     color: Colors.black,
                     borderRadius: BorderRadius.circular(10)
                   ),
                   child:Row(
                     children: [
                       Padding(padding: EdgeInsets.all(6),
                       child:Image.asset("Images/food.jpg",height: 100,width: 100,fit: BoxFit.cover,),

                       ),
                       SizedBox(
                         width: 30,
                       ),
                       Text("Add Food Items",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),

                     ],
                   ) ,
                 ),
               ),
             ),
           )
          ],
        ),
      ),
    );
  }
}
