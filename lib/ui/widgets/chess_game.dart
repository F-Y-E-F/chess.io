import 'package:chess_io/data/models/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class ChessGame extends StatelessWidget {
  final String opponentUserName;
  final int date;
  final String playerColor;
  final String playerNick;
  final String chessType;
  final String chessTime;
  final String image;
  final String whiteResult;
  final String blackResult;
  final WinType whoWin;

  ChessGame(
      this.date,
      this.playerColor,
      this.playerNick,
      this.opponentUserName,
      this.chessType,
      this.chessTime,
      this.image,
      this.whiteResult,
      this.blackResult,
      this.whoWin);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4.0, horizontal: 3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        image,
                        height: 30,
                        color: image == 'assets/images/rapid.png'
                            ? Colors.green
                            : Colors.amber,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          width: 40,
                          child: Text(
                            chessTime,
                            textAlign: TextAlign.center,
                          ))
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(2)),
                        ),
                        Text(playerColor == 'white'
                            ? playerNick
                            : opponentUserName),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(2)),
                        ),
                        Text(playerColor == 'black'
                            ? playerNick
                            : opponentUserName),
                      ],
                    ),
                  ],
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(whiteResult),
                        SizedBox(
                          height: 1,
                        ),
                        Text(blackResult),
                        SizedBox(
                          height: 1,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    if (whoWin == WinType.PLAYER_WIN)
                      Icon(
                        Icons.add_box_rounded,
                        color: const Color(0xff29b400),
                      ),
                    if (whoWin == WinType.OPPONENT_WIN)
                      Icon(
                        Icons.indeterminate_check_box,
                        color: Colors.red[600],
                      ),
                    if (whoWin == WinType.DRAW)
                      Icon(
                        Icons.adjust_rounded,
                        color: Colors.amber[600],
                      ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                        width: 60,
                        child: Text(
                          DateFormat.MMMd().format(
                              DateTime.fromMillisecondsSinceEpoch(date * 1000)),
                          textAlign: TextAlign.center,
                        ))
                  ],
                )),
              ],
            )),
      ),
    );
  }
}
