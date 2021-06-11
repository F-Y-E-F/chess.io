import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';


class LearnChessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ChessBoard(
          size: MediaQuery.of(context).size.width,
          onMove: (move) {
            print(move);
          },
          onCheckMate: (color) {
            print(color);
          },
          onDraw: () {
            print("DRAW!");
          }, onCheck: (PieceColor color) {

        },
        ),
      ),
    );
  }
}
