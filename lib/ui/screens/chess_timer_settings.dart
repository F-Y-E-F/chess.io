import 'package:chess_io/data/models/chess_time/chess_time_category.dart';
import 'package:chess_io/ui/widgets/chess_time_category_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChessTimerSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings',
              style: GoogleFonts.lato(
                color: const Color(0xff0D0221),
              )),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(7),
            child: GridView.count(
              crossAxisCount: 2,
              children: ChessTimeCategory.getAllCategories()
                  .map((type) => ChessTimeCategoryCard(
                      type.title, type.image, type.basicChessTimes))
                  .toList(),
              physics: BouncingScrollPhysics(),
            ),
          ),
        ));
  }
}
