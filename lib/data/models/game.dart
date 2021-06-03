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
  int userRating;
  String playerColor;
  String chessTime;


  String get whiteResult => whoWin == WinType.DRAW ? "½" : playerColor == 'white' ? whoWin == WinType.PLAYER_WIN ? '1':'0' : whoWin == WinType.PLAYER_WIN ? '0':'1';
  String get blackResult => whoWin == WinType.DRAW ? "½" : playerColor == 'black' ? whoWin == WinType.PLAYER_WIN ? '1':'0' : whoWin == WinType.PLAYER_WIN ? '0':'1';

  String get image {
    switch(chessType){
      case 'bullet': return 'assets/images/bullet.png';
      case 'blitz': return 'assets/images/blitz.png';
      case 'rapid': return 'assets/images/rapid.png';
      case 'daily': return 'assets/images/day.png';
      default: return 'assets/images/rapid.png';
    }
  }

  String get convertedChessTime{
    switch(chessType){
      case 'daily': return chessTime.contains('/') ? chessTime.substring(0,chessTime.indexOf('/')+1) + (int.tryParse(chessTime.substring(chessTime.indexOf('/')+1,chessTime.length)) / 86400).round().toString(): chessTime;break;
      default: return chessTime.contains('+') ? ((int.tryParse(chessTime.substring(0,chessTime.indexOf("+")))/60).round()).toString() + chessTime.substring(chessTime.indexOf("+"),chessTime.length) : ((int.tryParse((chessTime))?? -1)/60).round().toString();break;
    }
  }

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
      @required this.chessTime,
      @required this.userRating});

  factory Game.fromJson(Map<String, dynamic> map, String userName) {
    int opponentRating;
    int userRating;
    String opponentUserName;
    WinType whoWin;
    String winType;
    String color;

    if ((map['white']['username']).toString().toLowerCase() ==
        userName.toLowerCase()) {
      opponentRating = map['black']['rating'];
      userRating = map['white']['rating'];
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
      userRating = map['black']['rating'];
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
        userNick: userName,
        userRating: userRating);
  }
}

enum WinType { PLAYER_WIN, OPPONENT_WIN, DRAW }
