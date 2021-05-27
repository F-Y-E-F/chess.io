import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class BlitzStats {
  final int currentRating;
  final int currentRatingTime;
  final int bestRating;
  final int bestRatingTime;
  final int wins;
  final int losses;
  final int draws;

  String get formattedDate => DateFormat.yMMMd().format(DateTime.fromMillisecondsSinceEpoch(bestRatingTime*1000));


  BlitzStats(
      {@required this.bestRating,
      @required this.bestRatingTime,
      @required this.currentRating,
      @required this.currentRatingTime,
      @required this.draws,
      @required this.losses,
      @required this.wins});
}
