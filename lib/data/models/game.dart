import 'package:flutter/foundation.dart';

class Game {
  String url;
  String chessType;
  int time;
  bool isWin;
  String winType;
  String opponentUserName;
  int opponentRating;

  Game(
      {@required this.url,
      @required this.time,
      @required this.chessType,
      @required this.isWin,
      @required this.opponentRating,
      @required this.opponentUserName,
      @required this.winType});

  factory Game.fromJson(Map<String, dynamic> map, String userName) {
    int opponentRating;
    String opponentUserName;
    bool isWin;
    String winType;

    if((map['white']['username']).toString().toLowerCase() == userName.toLowerCase()){
      opponentRating = map['black']['rating'];
      opponentUserName = map['black']['username'];
      isWin = map['white']['result'] == 'win' ? true : false;
      winType = isWin ? map['black']['result'] : map['white']['result'];
    }else{
      opponentRating = map['white']['rating'];
      opponentUserName = map['white']['username'];
      isWin = map['black']['result'] == 'win' ? true : false;
      winType = isWin ? map['white']['result'] : map['black']['result'];
    }
    return Game(
      chessType: map['time_class'],
      time: map['end_time'],
      isWin: isWin,
      opponentRating: opponentRating,
      opponentUserName: opponentUserName,
      url: map['url'],
      winType: winType,
    );

  }
}
