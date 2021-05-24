import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("SIEMA",style: Theme.of(context).textTheme.headline1,),
      ),
    );
  }
}
