import 'package:chess_io/data/models/chess_time/chess_time.dart';
import 'package:chess_io/ui/widgets/chess_time_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChessCategoryTimes extends StatelessWidget {
  final String title;
  final List<ChessTime> times;

  ChessCategoryTimes(this.title, this.times);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,
            style: GoogleFonts.lato(
              color: const Color(0xff0D0221),
            )),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(7),
              child: GridView.count(
                crossAxisCount: 2,
                children: times
                    .map((type) => ChessTimeCard(
                        title,
                        type.time.toString() +
                            " + " +
                            type.incrementTime.toString()))
                    .toList(),
                physics: BouncingScrollPhysics(),
              ))),
    );
  }
}
