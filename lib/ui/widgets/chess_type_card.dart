import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

class ChessTypeCard extends StatefulWidget {
  @override
  _ChessTypeCardState createState() => _ChessTypeCardState();
}

class _ChessTypeCardState extends State<ChessTypeCard> {
  var isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => isChecked = !isChecked),
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
          'Blitz',
          style: GoogleFonts.lato(
              color: isChecked ? Colors.white : Theme.of(context).primaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
