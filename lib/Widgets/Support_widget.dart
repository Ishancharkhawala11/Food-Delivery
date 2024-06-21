
import 'package:flutter/material.dart';

class Appwidget{
  static TextStyle BoldfieldTextStyle(){
    return const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: "Poppins");
  }
  static TextStyle HeaderfieldTextStyle(){
    return const TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: "Poppins");
  }
  static TextStyle lightfieldTextStyle(){
    return const TextStyle(
        color: Colors.black38,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins");
  }
  static TextStyle SemifieldTextStyle(){
    return const TextStyle(
        color: Colors.black87,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        fontFamily: "Poppins");
  }

}