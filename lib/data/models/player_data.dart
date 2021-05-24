import 'package:flutter/foundation.dart';

class PlayerData {
  final String avatar;
  final int playerId;
  final String url;
  final String name;
  final String userName;
  final String country;
  final int followers;
  final int lastOnline;
  final int joined;

  PlayerData({
    @required this.avatar,
    @required this.playerId,
    @required this.url,
    @required this.name,
    @required this.userName,
    @required this.country,
    @required this.followers,
    @required this.lastOnline,
    @required this.joined,
  });

  factory PlayerData.fromJson(Map<String, dynamic> map) {
    return PlayerData(
      avatar: map['avatar'],
      playerId: map['player_id'],
      url: map['url'],
      name: map['name'],
      userName: map['username'],
      country: map['country'],
      followers: map['followers'],
      lastOnline: map['last_online'],
      joined: map['joined'],
    );
  }
}
