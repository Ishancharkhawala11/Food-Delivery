import 'package:flutter/material.dart';
import 'package:zometo/Widgets/Support_widget.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int a = 1;
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
            Image.asset(
              "Images/salad2.png",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              fit: BoxFit.fill,
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
                      "Mediterranean",
                      style: Appwidget.SemifieldTextStyle(),
                    ),
                    Text(
                      "Veg Tako Hash",
                      style: Appwidget.BoldfieldTextStyle(),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    if (a <= 1) {
                      a -= 0;
                    } else {
                      --a;
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
                    ++a;
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
              "ugcwuwgu wejbfwhjeb wguew8g wygfyf d whueg7wh ewe uge xzgwfyw "
              "uhsenbfub hbfheg ftfc etg6 gdfftrcv  wt6wq wcsxedwu yyt d wftwt ",
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
                      Text("\$28", style: Appwidget.HeaderfieldTextStyle()),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text("Add to Cart",
                            style: TextStyle(color: Colors.white,fontFamily: 'Poppins',fontSize: 16)),
                        const SizedBox(width: 30,),
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            color: Colors.black,
                          ),
                          child: const Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                        )
                      ],
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
