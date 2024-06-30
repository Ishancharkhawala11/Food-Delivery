import 'package:flutter/material.dart';
import 'package:zometo/Widgets/Support_widget.dart';
// import 'package:zometo/service/Shred_preference.dart';
import 'package:zometo/service/database.dart';

import '../service/Shred_prefernce.dart';

class Details extends StatefulWidget {
  final String image, name, details, price;
  Details({super.key, required this.image, required this.name, required this.details, required this.price});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int a = 1, total = 0;
  String? id;

  Future<void> getTheUserId() async {
    id = await shared_pref_method().getUserid();
    setState(() {

    });
  }

  Future<void> onLoad() async {
    await getTheUserId();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    onLoad();
    total = int.parse(widget.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.black,
                )),
            ClipRRect(
              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width / 2),
              child: Image.network(
                widget.image,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: Appwidget.SemifieldTextStyle(),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    if (a > 1) {
                      a--;
                      total -= int.parse(widget.price);
                    }
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "$a",
                  style: Appwidget.SemifieldTextStyle(),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    a++;
                    total += int.parse(widget.price);
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              widget.details,
              style: Appwidget.lightfieldTextStyle(),
              maxLines: 4,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text("Delivery Time", style: Appwidget.SemifieldTextStyle()),
                const SizedBox(
                  width: 30,
                ),
                const Icon(
                  Icons.alarm,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text("30Min", style: Appwidget.SemifieldTextStyle())
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Price",
                          style: Appwidget.SemifieldTextStyle()),
                      Text("\$" + total.toString(), style: Appwidget.HeaderfieldTextStyle()),
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (id != null) {
                        Map<String, dynamic> addFood = {
                          "Name": widget.name,
                          "Quantity": a.toString(),
                          "total": total.toString(),
                          "Image": widget.image,
                        };
                        await databaseMethods().ADdFoodCart(addFood, id!);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.orangeAccent,
                          content: const Text(
                            "Food Added to cart",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: const Text(
                            "User ID is not available",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ));
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text("Add to Cart",
                              style: TextStyle(color: Colors.white, fontFamily: 'Poppins', fontSize: 16)),
                          const SizedBox(width: 30,),
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                              color: Colors.black,
                            ),
                            child: const Icon(Icons.shopping_cart_outlined, color: Colors.white,),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
