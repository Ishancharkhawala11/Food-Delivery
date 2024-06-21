
import 'package:flutter/material.dart';
import 'package:zometo/Pages/Details.dart';
import 'package:zometo/Widgets/Support_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecream = false, pizza = false, salad = false, burger = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
          left: 10,
          top: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hello Ishan,", style: Appwidget.BoldfieldTextStyle()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(color: Colors.black),
                  child: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Delicious Food", style: Appwidget.HeaderfieldTextStyle()),
            Text("Discover and Get Great Food",
                style: Appwidget.lightfieldTextStyle()),
            const SizedBox(
              height: 30,
            ),
            Container(margin: const EdgeInsets.only(right: 20), child: showItem()),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Details()));
                  },
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "Images/salad2.png",
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                "Veggie Taco Hash",
                                style: Appwidget.SemifieldTextStyle(),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Fresh and Healthy",
                                style: Appwidget.lightfieldTextStyle(),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "\$25",
                                style: Appwidget.SemifieldTextStyle(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.all(4),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "Images/salad2.png",
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              "Mix veg Salad",
                              style: Appwidget.SemifieldTextStyle(),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Fresh and Healthy",
                              style: Appwidget.lightfieldTextStyle(),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "\$25",
                              style: Appwidget.SemifieldTextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "Images/salad2.png",
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Mediterranean Chickpea Salad",
                                style: Appwidget.SemifieldTextStyle(),
                              )),
                          const SizedBox(width: 20,),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Honey Goot cheese",
                                style: Appwidget.lightfieldTextStyle(),
                              )),
                          const SizedBox(width: 20,),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "\$28",
                                style: Appwidget.SemifieldTextStyle(),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            icecream = true;
            pizza = false;
            salad = false;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: icecream ? Colors.black : Colors.white,
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "Images/ice-cream.png",
                height: 40,
                fit: BoxFit.cover,
                width: 40,
                color: icecream ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            pizza = true;
            salad = false;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Container(
              decoration: BoxDecoration(
                color: pizza ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "Images/pizza.png",
                height: 40,
                fit: BoxFit.cover,
                width: 40,
                color: pizza ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            burger = true;
            icecream = false;
            salad = false;
            pizza = false;
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Container(
              decoration: BoxDecoration(
                color: burger ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "Images/burger.png",
                height: 40,
                fit: BoxFit.cover,
                width: 40,
                color: burger ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            salad = true;
            burger = false;
            icecream = false;
            pizza = false;
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: salad ? Colors.black : Colors.white,
              ),
              child: Image.asset(
                "Images/salad.png",
                height: 40,
                fit: BoxFit.cover,
                width: 40,
                color: salad ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
