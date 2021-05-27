
import 'package:chess_io/data/models/game.dart';
import 'package:chess_io/data/remote/fetch_chess_data.dart';
import 'package:flutter/material.dart';

class GamesProvider with ChangeNotifier{

  List<Game> _games = [];

  List<Game> get games => [..._games];

  Future<void> setGames(String nickName) async{
    final data = await FetchChessData.fetchLastMonthPlayerGames(nickName);
    _games.clear();
    _games.addAll(data.reversed.toList());
    notifyListeners();
  }

}