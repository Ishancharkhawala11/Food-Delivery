import 'package:cloud_firestore/cloud_firestore.dart';

class databaseMethods {
  Future addUserDetails(Map<String, dynamic> userInfo, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfo);
  }
  updateWallet(String id,String Amount) async{
    return await FirebaseFirestore.instance.collection("users").doc(id).update(
        {"Wallet":Amount});
  }
  Future addFoodItem(Map<String, dynamic> userInfo, String name) async {
    return await FirebaseFirestore.instance
        .collection(name)
        .add(userInfo);
  }
  Future<Stream<QuerySnapshot>> getFoodItem(String name)async{
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }
  Future ADdFoodCart(Map<String, dynamic> userInfo, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id).collection("cart").add(userInfo);
  }
  Future<Stream<QuerySnapshot>> getFoodCart(String id)async{
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id).collection("cart").snapshots();
  }

}
