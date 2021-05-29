import 'package:flutter/foundation.dart';

class Game {
  String url;
  String chessType;
  int time;
  WinType whoWin;
  String winType;
  String userNick;
  String opponentUserName;
  int opponentRating;
  String playerColor;
  String chessTime;

  Game(
      {@required this.url,
      @required this.time,
      @required this.chessType,
      @required this.whoWin,
      @required this.opponentRating,
      @required this.opponentUserName,
      @required this.winType,
      @required this.playerColor,
      @required this.userNick,
      @required this.chessTime});

  factory Game.fromJson(Map<String, dynamic> map, String userName) {
    int opponentRating;
    String opponentUserName;
    WinType whoWin;
    String winType;
    String color;

    if ((map['white']['username']).toString().toLowerCase() ==
        userName.toLowerCase()) {
      opponentRating = map['black']['rating'];
      opponentUserName = map['black']['username'];
      whoWin = map['white']['result'] == 'win'
          ? WinType.PLAYER_WIN
          : map['black']['result'] == 'win'
              ? WinType.OPPONENT_WIN
              : WinType.DRAW;
      winType = whoWin == WinType.PLAYER_WIN
          ? map['black']['result']
          : map['white']['result'];
      color = 'white';
    } else {
      opponentRating = map['white']['rating'];
      opponentUserName = map['white']['username'];
      whoWin = map['black']['result'] == 'win'
          ? WinType.PLAYER_WIN
          : map['white']['result'] == 'win'
              ? WinType.OPPONENT_WIN
              : WinType.DRAW;
      winType = whoWin == WinType.PLAYER_WIN
          ? map['white']['result']
          : map['black']['result'];
      color = 'black';
    }
    return Game(
        chessType: map['time_class'],
        time: map['end_time'],
        chessTime: map['time_control'],
        whoWin: whoWin,
        opponentRating: opponentRating,
        opponentUserName: opponentUserName,
        url: map['url'],
        winType: winType,
        playerColor: color,
        userNick: userName);
  }
}

enum WinType { PLAYER_WIN, OPPONENT_WIN, DRAW }
