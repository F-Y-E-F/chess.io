import 'package:chess_io/data/models/game.dart';
import 'package:chess_io/data/remote/fetch_chess_data.dart';
import 'package:flutter/material.dart';

class GamesProvider with ChangeNotifier {
  List<Game> _games = [];

  List<Game> get games => [..._games];

  List<Game> _filteredGames = [];

  List<Game> get filteredGames => [..._filteredGames];

  Future<void> setGames(String nickName) async {
    try {
      final data = await FetchChessData.fetchLastMonthPlayerGames(nickName);
      _games.clear();
      _games.addAll(data.reversed.toList());
      _filteredGames.clear();
      _filteredGames.addAll(data.reversed.toList());
      notifyListeners();
    } catch (e) {}
  }

  void filterGames(String chessType) {
    List<Game> helperGames = _games;
    _filteredGames.clear();
    _filteredGames.addAll(helperGames.where((game) => game.chessType.toLowerCase() == chessType.toLowerCase()).toList());
    notifyListeners();
  }
}
