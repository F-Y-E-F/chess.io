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
    final playerStats = provider.playerStats;


    return Scaffold(
      body: SingleChildScrollView(
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
                  padding: const EdgeInsets.only(left : 15),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ChessTypeCard(),
                    ChessTypeCard(),
                    ChessTypeCard(),
                    ChessTypeCard()
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 10),
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                          Text("Current Ranking",style: GoogleFonts.lato(color: Colors.grey[500],fontSize: 16),),
                          Text(playerStats.blitzStats.currentRating.toString(),style: theme.textTheme.headline1,),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20,right: 20,top: 0,bottom: 10),
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text("Best Ranking (${playerStats.blitzStats.formattedDate})",style: GoogleFonts.lato(color: Colors.grey[500],fontSize: 16),),
                        Text(playerStats.blitzStats.bestRating.toString() ,style: theme.textTheme.headline1,),
                      ],
                    ),
                  ),
                ),
              ),
              StatsPieChart(playerStats.blitzStats.wins,playerStats.blitzStats.draws,playerStats.blitzStats.losses)

            ],
          ),
        ),
      ),
    );
  }
}
