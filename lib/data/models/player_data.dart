import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

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

  String get formattedUserName => toBeginningOfSentenceCase(userName ?? "username");

  factory PlayerData.fromJson(Map<String, dynamic> map) {
    return PlayerData(
      avatar: map['avatar'] ?? 'https://cdn.pixabay.com/photo/2014/04/02/10/25/man-303792_960_720.png',
      playerId: map['player_id'] ?? 1,
      url: map['url'] ?? '',
      name: map['name'] ?? '',
      userName: map['username'] ?? '',
      country: map['country'] ?? '',
      followers: map['followers'] ?? 1,
      lastOnline: map['last_online'] ?? 1,
      joined: map['joined'] ?? 1,
    );
  }
}
