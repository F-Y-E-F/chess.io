import 'dart:convert';
import 'package:chess_io/data/models/player_data.dart';
import 'package:http/http.dart' as http;

class FetchChessData{


  static Future fetchChessComData(String userNick) async {
    final playerDataResponse = await http.get(Uri.parse('https://api.chess.com/pub/player/aronpm'));
    final playerStatsResponse = await http.get(Uri.parse('https://api.chess.com/pub/player/aronpm'));

    if (playerDataResponse.statusCode == 200 && playerStatsResponse.statusCode == 200) {
      final jsonPlayerData = jsonDecode(playerDataResponse.body);
      final jsonPlayerStats = jsonDecode(playerDataResponse.body);

      PlayerData data = PlayerData.fromJson(jsonPlayerData);
      print(data.avatar);
      print(data.playerId);
      print(data.url);
      print(data.name);
      print(data.userName);
      print(data.country);
      print(data.followers);
      print(data.lastOnline);
      print(data.joined);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }


}
