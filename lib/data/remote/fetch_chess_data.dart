import 'dart:convert';
import 'package:chess_io/data/models/game.dart';
import 'package:chess_io/data/models/player_data.dart';
import 'package:chess_io/data/models/player_stats/player_stats.dart';
import 'package:http/http.dart' as http;

class FetchChessData{


  static Future<PlayerData> fetchChessComPlayerData(String userNick) async {
    final playerDataResponse = await http.get(Uri.parse('https://api.chess.com/pub/player/$userNick'));

    if (playerDataResponse.statusCode == 200) {
      final jsonPlayerData = jsonDecode(playerDataResponse.body);
      return PlayerData.fromJson(jsonPlayerData);
    } else {
      throw Exception('Cannot find player with provided nick on chess.com');
    }
  }

  static Future<PlayerStats> fetchChessComPlayerStats(String userNick) async {
    final playerStatsResponse = await http.get(Uri.parse('https://api.chess.com/pub/player/$userNick/stats'));
    if (playerStatsResponse.statusCode == 200 ) {
      final jsonPlayerStats = jsonDecode(playerStatsResponse.body);
      return PlayerStats.fromJson(jsonPlayerStats);
    } else {
      throw Exception('Cannot find player with provided nick on chess.com');
    }
  }

  static Future<List<Game>> fetchLastMonthPlayerGames(String userNick) async {
    var date = DateTime.parse(DateTime.now().toString());

    final playerGamesResponse = await http.get(Uri.parse('https://api.chess.com/pub/player/$userNick/games/${date.year}/${date.month>9 ? date.month : "0" + date.month.toString()}'));
    if (playerGamesResponse.statusCode == 200 ) {
      final jsonPlayerStats = jsonDecode(playerGamesResponse.body);
      List<Game> games = [];
      for(var gameMap in jsonPlayerStats['games']){
        games.add(Game.fromJson(gameMap,userNick));
      }
      return games;
    } else {
      throw Exception('An Error Occured try again later');
    }
  }


}
