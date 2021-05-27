
import 'package:chess_io/data/models/player_data.dart';
import 'package:chess_io/data/models/player_stats.dart';
import 'package:chess_io/data/remote/fetch_chess_data.dart';
import 'package:flutter/material.dart';

class ChessDataProvider with ChangeNotifier{

    PlayerData data;
    PlayerStats stats;


    PlayerData get playerData => data;
    PlayerStats get playerStats => stats;


    Future<void> setData(String nick) async{
      data = await FetchChessData.fetchChessComPlayerData(nick);
      notifyListeners();
    }

    Future<void> setStats(String nick) async{
      stats = await FetchChessData.fetchChessComPlayerStats(nick);
      notifyListeners();
    }

}