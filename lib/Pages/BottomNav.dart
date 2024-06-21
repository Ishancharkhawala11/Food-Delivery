import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:zometo/Pages/Home.dart';
import 'package:zometo/Pages/Order.dart';
import 'package:zometo/Pages/Profile.dart';
import 'package:zometo/Pages/Wallet.dart';
class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex=0;
  late List<Widget> pages;
  late Widget currentPage;
  late Home home;
  late Order order;
  late Profile profile;
  late Wallet wallet;
  @override
  void initState() {
    home=const Home();
    order=const Order();
    profile=const Profile();
    wallet=const Wallet();
    pages=[home,order,wallet,profile];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration:const Duration(milliseconds: 500),
        onTap: (int index){
          currentIndex=index;
          setState(() {

          });
        },
        items: const [
        Icon(Icons.home_outlined,color: Colors.white,),
        Icon(Icons.shopping_bag_outlined,color: Colors.white,),
        Icon(Icons.wallet_outlined,color: Colors.white,),
        Icon(Icons.person_outline,color: Colors.white,),
      ],),
      body: pages[currentIndex],
    );
  }
}
