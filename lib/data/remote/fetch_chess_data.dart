import 'dart:convert';
import 'package:chess_io/data/models/player_data.dart';
import 'package:http/http.dart' as http;

class FetchChessData{


  static Future<PlayerData> fetchChessComData(String userNick) async {
    print(userNick);
    final playerDataResponse = await http.get(Uri.parse('https://api.chess.com/pub/player/$userNick'));
    //final playerStatsResponse = await http.get(Uri.parse('https://api.chess.com/pub/player/$userNick'));

    if (playerDataResponse.statusCode == 200 /*&& *//*playerStatsResponse.statusCode == 200*/) {
      final jsonPlayerData = jsonDecode(playerDataResponse.body);
      // final jsonPlayerStats = jsonDecode(playerDataResponse.body);
      return PlayerData.fromJson(jsonPlayerData);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Cannot find player with provided nick on chess.com');
    }
  }


}
