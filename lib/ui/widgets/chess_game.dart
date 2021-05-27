import 'package:flutter/material.dart';

class ChessGame extends StatelessWidget {
  final bool isWin;
  ChessGame(this.isWin);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      color: !isWin ? Colors.red:Colors.green,
    );
  }
}
