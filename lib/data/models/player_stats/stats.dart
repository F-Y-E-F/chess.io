import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class Stats {
  final int currentRating;
  final int currentRatingTime;
  final int bestRating;
  final int bestRatingTime;
  final int wins;
  final int losses;
  final int draws;

  String get formattedDate => DateFormat.yMMMd().format(DateTime.fromMillisecondsSinceEpoch((bestRatingTime ?? 0)*1000));

  Stats(
      {@required this.bestRating,
      @required this.bestRatingTime,
      @required this.currentRating,
      @required this.currentRatingTime,
      @required this.draws,
      @required this.losses,
      @required this.wins});
}
