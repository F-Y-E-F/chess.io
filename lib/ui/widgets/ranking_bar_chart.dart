import 'dart:math';

import 'package:chess_io/data/remote/providers/games_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class RankingBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GamesProvider>(
      builder: (_, gamesProvider, __) => gamesProvider.filteredGames.isNotEmpty ? AspectRatio(
        aspectRatio: 1.05,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
            child: LineChart(mainData(gamesProvider.filteredGames.map((e) => {
              "rating":e.userRating,
              'id':e.time
            }).toList()),),
          ),
        ),
      ):Container(),
    );
  }

  LineChartData mainData(List<Map<String,int>> ratingList) {
    ratingList = ratingList.reversed.toList();
    final maxY = ratingList.map<double>((e) => e['rating'].toDouble()).reduce(max);
    final minY = ratingList.map<double>((e) => e['rating'].toDouble()).reduce(min);
    return LineChartData(
      gridData: FlGridData(
        horizontalInterval: maxY-minY > 150 ?  100 : 10,
        show: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color:  Colors.grey[400],
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,getTitles: (f) => ""),
        leftTitles: SideTitles(
          interval: maxY-minY > 150 ?  100 : 10,
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
             return (((value.toInt()/10).ceilToDouble()*10).toInt()-10).toString();
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: ratingList.length.toDouble(),
      minY: minY,
      maxY: maxY,
      lineBarsData: [
        LineChartBarData(
          spots: ratingList.map((rating) => FlSpot(ratingList.indexOf(ratingList.firstWhere((element) => element['id']==rating['id'])).toDouble(),rating['rating'].toDouble())).toList(),
          isCurved: true,
          colors: [
            Colors.orange[300],
            Colors.orange[900],
          ],
          barWidth: 5,
          curveSmoothness: 0.2,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
        ),
      ],
    );
  }

}