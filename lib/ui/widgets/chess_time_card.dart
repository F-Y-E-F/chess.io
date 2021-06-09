import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChessTimeCard extends StatelessWidget {
  final String title;
  final String time;
  ChessTimeCard(this.title,this.time);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Card(
        margin: const EdgeInsets.all(7),
        color: Colors.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(title,style: GoogleFonts.lato(color: Theme.of(context).primaryColor.withOpacity(0.4),fontSize: 15)),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              time,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 36),
            ),
          ),
          Text('min',style: GoogleFonts.lato(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 18),),
        ]),
      ),
    );
  }
}
