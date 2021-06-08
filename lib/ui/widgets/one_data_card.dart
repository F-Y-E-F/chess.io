import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class OneDataCard extends StatelessWidget {
  final String title,data;
  OneDataCard(this.title,this.data);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(
          left: 20, right: 20, top: 10, bottom: 10),
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                title,
                style: GoogleFonts.lato(
                    color: Colors.grey[500], fontSize: 16),
              ),
              Text(
                data,
                style: theme.textTheme.headline1,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
