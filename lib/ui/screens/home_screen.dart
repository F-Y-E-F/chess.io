import 'package:chess_io/data/remote/providers/chess_data_provider.dart';
import 'package:chess_io/ui/widgets/chess_type_card.dart';
import 'package:chess_io/ui/widgets/stats_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = Provider.of<ChessDataProvider>(context);
    final playerData = provider.playerData;
    final playerFullStats = provider.playerFullStats;
    final playerStats = provider.playerStats;

    return Scaffold(
      body: (playerStats != null) ? SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello', style: theme.textTheme.headline6),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          playerData.formattedUserName,
                          style: theme.textTheme.headline2,
                        ),
                      ],
                    ),
                    ClipRRect(
                      child: Image.network(
                        playerData.avatar,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                height: 50.0,
                child: ListView(
                  padding: const EdgeInsets.only(left: 15),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    if (playerFullStats.blitzStats != null) ChessTypeCard("Blitz",changeStats),
                    if (playerFullStats.bulletStats != null) ChessTypeCard("Bullet",changeStats),
                    if (playerFullStats.dailyStats != null) ChessTypeCard("Daily",changeStats),
                    if (playerFullStats.rapidStats != null) ChessTypeCard("Rapid",changeStats)
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 30, bottom: 10),
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
                          "Current Ranking",
                          style: GoogleFonts.lato(
                              color: Colors.grey[500], fontSize: 16),
                        ),
                        Text(
                          (playerStats.currentRating?? 0).toString(),
                          style: theme.textTheme.headline1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if(playerStats.bestRating!=null) Container(
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 0, bottom: 10),
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
                          "Best Ranking (${playerStats.formattedDate})",
                          style: GoogleFonts.lato(
                              color: Colors.grey[500], fontSize: 16),
                        ),
                        Text(
                          playerStats.bestRating.toString(),
                          style: theme.textTheme.headline1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              StatsPieChart(playerStats.wins ?? 0,
                  playerStats.draws ?? 0, playerStats.losses?? 0)
            ],
          ),
        ),
      ):Center(child: Text("BRAK DANYCH")),
    );
  }


  void changeStats(BuildContext context,String statsName){
    Provider.of<ChessDataProvider>(context,listen: false).changeStats(statsName);
  }

}
