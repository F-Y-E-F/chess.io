import 'package:chess_io/data/remote/providers/chess_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChessTypeCard extends StatefulWidget {
  final String title;
  final void Function(BuildContext, String) changeStats;

  ChessTypeCard(this.title, this.changeStats);

  @override
  _ChessTypeCardState createState() => _ChessTypeCardState();
}

class _ChessTypeCardState extends State<ChessTypeCard> {
  @override
  Widget build(BuildContext context) {
    final isChecked = Provider.of<ChessDataProvider>(context)
            .currentCheckedStats ==
        widget.title.toLowerCase();
    return GestureDetector(
      onTap: () => setState(() {
        widget.changeStats(context, widget.title.toLowerCase());
      }),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 7),
        decoration: BoxDecoration(
          gradient: isChecked
              ? LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Colors.orange[300],
                    Colors.orange[900],
                  ],
                )
              : null,
          color: !isChecked ? Colors.white : null,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(100),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 70),
        child: Center(
            child: Text(
          widget.title,
          style: GoogleFonts.lato(
              color: isChecked ? Colors.white : Theme.of(context).primaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
