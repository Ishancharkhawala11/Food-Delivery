import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:zometo/Widgets/App_constant.dart';
import 'package:zometo/Widgets/Support_widget.dart';
import 'package:http/http.dart' as http;
class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  Map<String,dynamic>? paymentIntent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
                elevation: 2,
                child: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Center(
                        child: Text(
                      "Wallet",
                      style: Appwidget.HeaderfieldTextStyle(),
                    )))),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFFF2F2F2),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "Images/wallet.png",
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Wallet",
                        style: Appwidget.lightfieldTextStyle(),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "\$100",
                        style: Appwidget.BoldfieldTextStyle(),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Add money",
                style: Appwidget.SemifieldTextStyle(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(onTap: (){
                  MakePayment('100');
                },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFE9E2E2),
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\$" + "100",
                      style: Appwidget.SemifieldTextStyle(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFE9E2E2),
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "\$" + "500",
                    style: Appwidget.SemifieldTextStyle(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFE9E2E2),
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "\$" + "1000",
                    style: Appwidget.SemifieldTextStyle(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFE9E2E2),
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "\$" + "2000",
                    style: Appwidget.SemifieldTextStyle(),
                  ),
                )
              ],
            ),
            SizedBox(height: 50,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 12),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Color(0xFF008080),
              borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "Add Money",
                  style: TextStyle(
                      color: Colors.white, fontSize: 16, fontFamily: "Poppins",fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Future<void> MakePayment(String amount) async {
    try {
      paymentIntent = await createPaymentIntent(amount, 'INR');
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent!['client_secret'],
              style: ThemeMode.dark,
              merchantDisplayName: 'Adnan')).then((value) {});
      displayPaymentSheet(amount);
    } catch (e,s) {
print("exeception:$e$s");
    }
  }
  displayPaymentSheet(String amount) async{
try{
  await Stripe.instance.presentPaymentSheet().then((value)async{
    showDialog(context: context, builder: (_)=>AlertDialog(
      content: Column(
        children: [
          Row(
            children: [
              Icon(Icons.check_circle,color: Colors.green,),
              Text("Payment SuccessFul")
            ],
          )
        ],
      ),
    ));

    paymentIntent=null;
  }).onError((error,stackTrace){
    print("Error is ====>$error  $stackTrace");
  });
}on StripeException catch(e){
  print("Error is----->$e");
  showDialog(context: context, builder: (_)=>const AlertDialog(
    content: Text("cancelled"),
  ));
}catch(e){
  print("$e");
}
  }
  createPaymentIntent(String amount, String Currnecy)async{
    try{
      Map<String,dynamic> body={
        'amount':calculateAmount(amount),
        'currency':Currnecy,
        'payment_method_types[]':'card'
      };
      var response=await http.post(
        Uri.parse("https://api.stripe.com/v1/payment_intents"),
        headers: {
          'Authorization':'Bearer $Secret_key',
          'Content-type':'application/x-www-form-urlencoded'
        },
        body: body
      );
      print("payment Intent Body--->${response.body.toString()}");
      return jsonDecode(response.body);
    }catch(err){
      print("err charging user:${err.toString()}");
    }
  }
  calculateAmount(String amount){
    final calculateAmount=int.parse(amount)*100;
    return calculateAmount.toString();
  }
}
