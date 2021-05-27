import 'package:chess_io/data/models/player_stats/blitz_stats.dart';
import 'package:flutter/foundation.dart';

class PlayerStats {
  final BlitzStats blitzStats;

  PlayerStats({
    @required this.blitzStats,
  });

  factory PlayerStats.fromJson(Map<String, dynamic> map) {
    return PlayerStats(
        blitzStats: BlitzStats(
      bestRating: map['chess_blitz']['best']['rating'],
      bestRatingTime: map['chess_blitz']['best']['date'],
      currentRating: map['chess_blitz']['last']['rating'],
      currentRatingTime: map['chess_blitz']['last']['date'],
      draws: map['chess_blitz']['record']['draw'],
      losses: map['chess_blitz']['record']['loss'],
      wins: map['chess_blitz']['record']['win'],
    ));
  }
}
