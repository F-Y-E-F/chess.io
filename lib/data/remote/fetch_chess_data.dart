import 'dart:convert';
import 'package:chess_io/data/models/player_data.dart';
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

  static Future<PlayerData> fetchChessComPlayerStats(String userNick) async {
    final playerStatsResponse = await http.get(Uri.parse('https://api.chess.com/pub/player/$userNick/stats'));

    if (playerStatsResponse.statusCode == 200 ) {
      final jsonPlayerStats = jsonDecode(playerStatsResponse.body);
      return PlayerData.fromJson(jsonPlayerStats);
    } else {
      throw Exception('Cannot find player with provided nick on chess.com');
    }
  }


}
