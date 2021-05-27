import 'package:chess_io/data/models/player_stats/stats.dart';
import 'package:flutter/foundation.dart';

class PlayerStats {
  final Stats blitzStats;
  final Stats bulletStats;
  final Stats dailyStats;
  final Stats rapidStats;

  PlayerStats({
    @required this.blitzStats,
    @required this.bulletStats,
    @required this.dailyStats,
    @required this.rapidStats,
  });

  factory PlayerStats.fromJson(Map<String, dynamic> map) {
    return PlayerStats(
        blitzStats: getStats("chess_blitz",map),
        bulletStats: getStats("chess_bullet",map),
        dailyStats: getStats("chess_daily",map),
        rapidStats: getStats("chess_rapid",map));
  }


  static Stats getStats(String chessType, map) =>
      map[chessType] != null ? Stats(
        bestRating: map[chessType]['best'] != null ? map[chessType]['best']['rating'] : null,
        bestRatingTime: map[chessType]['best'] != null ?map[chessType]['best']['date'] : null,
        currentRating: map[chessType]['last'] != null ? map[chessType]['last']['rating'] : null,
        currentRatingTime: map[chessType]['last'] != null ? map[chessType]['last']['date'] : null,
        draws: map[chessType]['record']!=null ? map[chessType]['record']['draw'] : null,
        losses:map[chessType]['record']!=null ? map[chessType]['record']['loss'] : null,
        wins: map[chessType]['record']!=null ? map[chessType]['record']['win'] : null,
      ):null;
}
