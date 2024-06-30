import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zometo/service/Shred_prefernce.dart';
import 'package:zometo/service/database.dart';
import '../Widgets/Support_widget.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  String? id, wallet;
  int total = 0,amount2=0;
  Stream? foodStream;

  void startTimer() {
    Timer(Duration(milliseconds: 100), () {
      amount2=total;
      setState(() {});
    });
  }

  getTheSharedPref() async {
    id = await shared_pref_method().getUserid();
    wallet = await shared_pref_method().getUserWallet();
    setState(() {});
  }

  OnTheLoad() async {
    await getTheSharedPref();
    foodStream = await databaseMethods().getFoodCart(id!);
    setState(() {});
  }

  @override
  void initState() {
    startTimer();
    OnTheLoad();
    super.initState();
  }

  Widget FoodCart() {
    return StreamBuilder(
      stream: foodStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          total=0;
          snapshot.data.docs.forEach((doc) {
            total += int.parse(doc["total"]);

          });

          return ListView.builder(
            itemBuilder: (context, index) {
              DocumentSnapshot ds = snapshot.data.docs[index];
              return Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 90,
                          width: 40,
                          child: Center(child: Text(ds["Quantity"])),
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(width: 20),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.network(
                            ds["Image"],
                            height: 90,
                            width: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Text(
                              ds["Name"],
                              style: Appwidget.SemifieldTextStyle(),
                            ),
                            Text(
                              ds["total"],
                              style: Appwidget.SemifieldTextStyle(),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            padding: EdgeInsets.zero,
            itemCount: snapshot.data.docs.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
                elevation: 2,
                child: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Center(
                        child: Text(
                          "Food Cart",
                          style: Appwidget.HeaderfieldTextStyle(),
                        )))),
            SizedBox(height: 20),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              child: FoodCart(),
            ),
            Spacer(),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Price",
                    style: Appwidget.BoldfieldTextStyle(),
                  ),
                  Text(
                    "\$" + total.toString(),
                    style: Appwidget.HeaderfieldTextStyle(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                int amount = int.parse(wallet!)-amount2;
                await databaseMethods().updateWallet(id!, amount.toString());
                await shared_pref_method().saveUserWallet(amount.toString());
                setState(() {

                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.black, borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Center(
                  child: Text(
                    "CheckOut",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
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
