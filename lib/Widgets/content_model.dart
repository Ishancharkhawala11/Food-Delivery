import 'package:zometo/Pages/Onboarding.dart';

class OnbOardiingContent {
  late String image;
  late String Title;
  late String Description;
  OnbOardiingContent(
      {required this.image, required this.Title, required this.Description});
}

List<OnbOardiingContent> contents = [
  OnbOardiingContent(
      image: "Images/screen1.png",
      Title: "Select from Our\n      Best Menu",
      Description: "Pick Your Food From Our Menu\n          More Then 35 Times"),
  OnbOardiingContent(
      image: "Images/screen2.png",
      Title: "Easy and Online Payment",
      Description:
          "You can pay cash on delivery and\n       card payment is  Available"),
  OnbOardiingContent(
      image: "Images/screen3.png", Title: "Quick Delivery at\n   our DoorSteps", Description: "Deliver your food at your\n           DoorSteps")
];
