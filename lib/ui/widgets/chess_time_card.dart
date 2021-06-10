import 'package:chess_io/data/remote/providers/current_time_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChessTimeCard extends StatelessWidget {
  final String title;
  final int time;
  final int incrementTime;

  ChessTimeCard(this.title, this.time,this.incrementTime);

  @override
  Widget build(BuildContext context) {
    final timeProvider = Provider.of<CurrentTimeProvider>(context);
    final isChecked = (timeProvider.time == time && timeProvider.incrementTime == incrementTime);
    return GestureDetector(
      onTap: () async => await _changeTime(context),
      child: Card(
        margin: const EdgeInsets.all(7),
        color:  null,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: isChecked ? null : Colors.white,
            gradient: isChecked ? LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Colors.orange[400],
                Colors.orange[900],
              ],
            ): null
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(title,
                style: GoogleFonts.lato(
                    color: !isChecked ?  Theme.of(context).primaryColor.withOpacity(0.4):Colors.white,
                    fontSize: 15)),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                time.toString() + " + " + incrementTime.toString(),
                style: Theme.of(context).textTheme.headline4.copyWith(
                    color: !isChecked ?  Theme.of(context).primaryColor:Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 36),
              ),
            ),
            Text(
              'min',
              style: GoogleFonts.lato(
                  color: !isChecked ?  Theme.of(context).primaryColor:Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> _changeTime(BuildContext context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('time', time*60);
    await prefs.setInt('incrementTime', incrementTime);
    Provider.of<CurrentTimeProvider>(context,listen: false).setTimes(time, incrementTime);
  }
}
