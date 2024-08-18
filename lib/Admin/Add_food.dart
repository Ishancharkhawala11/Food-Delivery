import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:zometo/Pages/Details.dart';
import 'package:zometo/Widgets/Support_widget.dart';
import 'package:zometo/service/database.dart';

class Add_food extends StatefulWidget {
  const Add_food({super.key});

  @override
  State<Add_food> createState() => _Add_foodState();
}

class _Add_foodState extends State<Add_food> {
  TextEditingController Item = TextEditingController();
  TextEditingController Price = TextEditingController();
  TextEditingController details = TextEditingController();
  String? selectedCategory; // Added this line for dropdown value
  final ImagePicker picker=ImagePicker();
  File? selectImage;
  final List<String> ItemsList = ["ice-cream", "pizaa", "burger", "salad"];
  Future getimage()async{
    var image=await picker.pickImage(source: ImageSource.gallery);
   selectImage=File(image!.path);
   setState(() {

   });
  }
  uploadItem()async{
    if(selectImage!=null && Item.text.isNotEmpty && Price.text.isNotEmpty && details.text.isNotEmpty)
      {
            String addId=randomAlphaNumeric(10);
            Reference firebasestorage=FirebaseStorage.instance.ref().child("BlockImages").child(addId);
            final UploadTask task=firebasestorage.putFile(selectImage!);
            var downloadurl=await(await task).ref.getDownloadURL();
            Map<String,dynamic> addItem={
              "image":downloadurl,
              "name":Item.text,
              "price":Price.text,
              "details":details.text
            };
            await databaseMethods().addFoodItem(addItem, selectedCategory!).then((value){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.orangeAccent,
                  content: Text(
                    "Item added successfully",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )));
            });
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_outlined, color: Color(0xFF373866)),
        ),
        centerTitle: true,
        title: Text(
          "Add Item",
          style: Appwidget.HeaderfieldTextStyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Upload the Item Picture",
                  style: Appwidget.SemifieldTextStyle()),
              SizedBox(height: 20),
             selectImage==null? GestureDetector(
               onTap: (){
                 getimage();
               },
               child: Center(
                  child: Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 150,
                      child: Icon(Icons.camera_alt_outlined, color: Colors.black),
                    ),
                  ),
                ),
             ):Center(
               child: Material(
                 elevation: 4,
                 borderRadius: BorderRadius.circular(20),
                 child: Container(
                   width: 150,
                   decoration: BoxDecoration(
                     border: Border.all(color: Colors.black, width: 1.5),
                     borderRadius: BorderRadius.circular(20),
                   ),
                   height: 150,
                   child: ClipRRect(
                     borderRadius: BorderRadius.circular(19),
                     child: Image.file(
                       selectImage!,
                       fit: BoxFit.cover,
                     
                     ),
                   ),
                 ),
               ),
             ),
              SizedBox(height: 30),
              Text("Item Name", style: Appwidget.SemifieldTextStyle()),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: Item,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Item Name",
                    hintStyle: Appwidget.lightfieldTextStyle(),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text("Item Price", style: Appwidget.SemifieldTextStyle()),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: Price,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Item Price",
                    hintStyle: Appwidget.lightfieldTextStyle(),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text("Item Details", style: Appwidget.SemifieldTextStyle()),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  maxLines: 6,
                  controller: details,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Item Details",
                    hintStyle: Appwidget.lightfieldTextStyle(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text("Select Catagory", style: Appwidget.SemifieldTextStyle()),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: ItemsList.map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ))).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value;
                      });
                    },
                    dropdownColor: Colors.white,
                    hint: Text("Select Category"),
                    iconSize: 36,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                    value: selectedCategory,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              GestureDetector(
                onTap: (){
                  uploadItem();
                },
                child: Center(
                  child: Material(
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical:20 ),
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.black
                      ),
                      child: Center(
                        child: Text(
                          "Add",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
