
import 'package:chess_io/data/models/player_data.dart';
import 'package:chess_io/data/models/player_stats/player_stats.dart';
import 'package:chess_io/data/models/player_stats/stats.dart';
import 'package:chess_io/data/remote/fetch_chess_data.dart';
import 'package:flutter/material.dart';

class ChessDataProvider with ChangeNotifier{

    PlayerData data;
    PlayerStats stats;
    String currentCheckedStats;


    PlayerData get playerData => data;
    PlayerStats get playerFullStats => stats;


    void changeStats(String statsName){
      currentCheckedStats = statsName;
      notifyListeners();
    }

    Stats get playerStats {
        switch(currentCheckedStats){
          case 'rapid': return stats.rapidStats;
          case 'blitz': return stats.blitzStats;
          case 'daily': return stats.dailyStats;
          case 'bullet': return stats.bulletStats;
          default:return stats.blitzStats;
        }
    }


    Future<void> setData(String nick) async{
      data = await FetchChessData.fetchChessComPlayerData(nick);
      notifyListeners();
    }

    Future<void> setStats(String nick) async{
      stats = await FetchChessData.fetchChessComPlayerStats(nick);
      if(stats.blitzStats != null) return currentCheckedStats = "blitz";
      if(stats.bulletStats != null) return currentCheckedStats = "bullet";
      if(stats.dailyStats != null) return currentCheckedStats = "daily";
      if(stats.rapidStats != null) return currentCheckedStats = "rapid";
      notifyListeners();
    }



}