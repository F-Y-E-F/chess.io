import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsPieChart extends StatefulWidget {
  final int losses;
  final int wins;
  final int draws;

  StatsPieChart(this.wins, this.draws, this.losses);

  @override
  State<StatefulWidget> createState() => StatsPieChartState();
}

class StatsPieChartState extends State<StatsPieChart> {
  @override
  Widget build(BuildContext context) {
    final titleFontStyle = GoogleFonts.lato(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700);
    final subTitleFontStyle = GoogleFonts.lato(color: Colors.grey[200], fontSize: 12, fontWeight: FontWeight.w500);
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Text("Total games",style: GoogleFonts.lato(
                            color: Colors.grey[500],fontSize: 16,
                          ),),
                        ),
                        PieChart(
                          PieChartData(
                              borderData: FlBorderData(
                                show: false,
                              ),
                              sectionsSpace: 0,
                              centerSpaceRadius: 60,
                              sections: showingSections()),
                          swapAnimationCurve: Curves.easeInOut,
                          swapAnimationDuration: Duration(seconds: 2),
                        ),
                        Align(
                          child: Text(
                              (widget.wins + widget.draws + widget.losses)
                                  .toString(),style: titleFontStyle.copyWith(fontSize: 24, color: Colors.black),),
                          alignment: Alignment.center,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 15),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: const Color(0xff29b400),
                                  borderRadius: const BorderRadius.only(
                                      topLeft: const Radius.circular(10),
                                      topRight: const Radius.circular(10))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(widget.wins.toString(),style: titleFontStyle),
                                  Text('WON',style: subTitleFontStyle),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.red[600],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(widget.losses.toString(),style: titleFontStyle),
                                  Text('LOST',style: subTitleFontStyle),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.amber[600],
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: const Radius.circular(10),
                                      bottomRight: const Radius.circular(10))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(widget.draws.toString(),style: titleFontStyle,),
                                  Text('DRAW',style: subTitleFontStyle,),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final radius = 15.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
              color: Colors.red[600], value: widget.losses.toDouble(), radius: radius, showTitle: false);
        case 1:
          return PieChartSectionData(
              color: const Color(0xff29b400),
              value: widget.wins.toDouble(),
              radius: radius,
              showTitle: false);
        case 2:
          return PieChartSectionData(
              color: Colors.amber[600], value: widget.draws.toDouble(), radius: radius, showTitle: false);
        default:
          throw Error();
      }
    });
  }
}
