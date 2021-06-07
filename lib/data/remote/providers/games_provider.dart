import 'package:chess_io/data/models/game.dart';
import 'package:chess_io/data/remote/fetch_chess_data.dart';
import 'package:flutter/material.dart';

class GamesProvider with ChangeNotifier {


  List<Game> _games = [];
  List<Game> get games => [..._games];
  List<Game> _filteredGames = [];
  List<Game> get filteredGames => [..._filteredGames];

  Game _bestGame;
  Game get bestGame => _bestGame;

  Game _worstGame;
  Game get worstGame => _worstGame;


  Future<void> setGames(String nickName,String curType) async {
    try {
      final data = await FetchChessData.fetchLastMonthPlayerGames(nickName);
      _games.clear();
      _games.addAll(data.reversed.toList());
      _filteredGames.clear();
      _filteredGames.addAll(data.reversed.toList());
      filterGames(curType);
    } catch (e) {}
  }

  void filterGames(String chessType) {


    List<Game> helperGames = _games;
    _filteredGames.clear();
    _filteredGames.addAll(helperGames.where((game) => game.chessType.toLowerCase() == chessType.toLowerCase()).toList());

    _bestGame = null;
    _worstGame = null;
    _filteredGames.forEach((game) {
        if(_worstGame==null && game.whoWin == WinType.OPPONENT_WIN){
          _worstGame = game;
          return;
        }
        if(_bestGame==null && game.whoWin == WinType.PLAYER_WIN){
          _bestGame = game;
          return;
        }
        if(game.whoWin == WinType.PLAYER_WIN && _bestGame!=null && (game.userRating - game.opponentRating) < (_bestGame.userRating - _bestGame.opponentRating)){
          _bestGame = game;
        }
        if(game.whoWin == WinType.OPPONENT_WIN && _worstGame!=null && (game.userRating - game.opponentRating) > (_worstGame.userRating - _worstGame.opponentRating)){
          _worstGame = game;
        }
    });
    notifyListeners();
  }
}
