

import 'dart:ui';

import 'package:flutter/material.dart';

class Dialogs{


  AlertDialog getLoadingDialog() =>
      AlertDialog(content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Loading...',style: TextStyle(color: const Color(0xff0D0221),fontSize: 18),),
          SizedBox(height: 15,),
          LinearProgressIndicator(backgroundColor: const Color(0xff0D0221),)
        ],
      ),);
}