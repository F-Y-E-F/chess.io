
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Snacks{

  static void showSnack(String title,BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
  }
}