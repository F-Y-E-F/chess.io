import 'dart:ui';

import 'package:chess_io/data/remote/providers/chess_data_provider.dart';
import 'package:chess_io/data/remote/providers/games_provider.dart';
import 'package:chess_io/ui/widgets/best_worst_game.dart';
import 'package:chess_io/ui/widgets/chess_game.dart';
import 'package:chess_io/ui/widgets/chess_type_card.dart';
import 'package:chess_io/ui/widgets/one_data_card.dart';
import 'package:chess_io/ui/widgets/ranking_bar_chart.dart';
import 'package:chess_io/ui/widgets/stats_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getGames();
  }

  Future<void> getGames() async {
    final provider = Provider.of<ChessDataProvider>(context, listen: false);
    await Provider.of<GamesProvider>(context, listen: false)
        .setGames(provider.playerData.userName,Provider.of<ChessDataProvider>(context,listen: false).currentCheckedStats);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = Provider.of<ChessDataProvider>(context);
    final playerData = provider.playerData;
    final playerFullStats = provider.playerFullStats;
    final playerStats = provider.playerStats;
    final int averageOpponentsRating = Provider.of<GamesProvider>(context).averageOpponentsRating;

    return Scaffold(
      body: (playerStats != null)
          ? SingleChildScrollView(
              physics: BouncingScrollPhysics(),
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
                          if (playerFullStats.blitzStats != null)
                            ChessTypeCard("Blitz", changeStats),
                          if (playerFullStats.bulletStats != null)
                            ChessTypeCard("Bullet", changeStats),
                          if (playerFullStats.dailyStats != null)
                            ChessTypeCard("Daily", changeStats),
                          if (playerFullStats.rapidStats != null)
                            ChessTypeCard("Rapid", changeStats)
                        ],
                      ),
                    ),
                    const SizedBox(height: 25,),
                    OneDataCard("Current Ranking", (playerStats.currentRating ?? 0).toString()),
                    if (playerStats.bestRating != null)
                      OneDataCard("Best Ranking (${playerStats.formattedDate})",  playerStats.bestRating.toString()),
                    StatsPieChart(playerStats.wins ?? 0, playerStats.draws ?? 0,
                        playerStats.losses ?? 0),
                    Padding(
                      padding: const EdgeInsets.only(top:25.0,bottom:10),
                      child: Text(
                        "Monthly Stats (${DateTime.now().month > 10 ? DateTime.now().month: '0'+DateTime.now().month.toString()}.${DateTime.now().year})",
                        style: GoogleFonts.lato(
                            color: Colors.grey[500], fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                    ),
                    BestWorstGame(),
                    if(averageOpponentsRating!=null) OneDataCard("Average Opponents Rating", averageOpponentsRating.toString()),
                    RankingBarChart(),
                    Consumer<GamesProvider>(
                      builder: (_, gamesProvider, __) => gamesProvider.filteredGames.length > 0 ? ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: gamesProvider.filteredGames.length,
                        itemBuilder: (context, index) => ChessGame(
                          gamesProvider.filteredGames[index].time,
                          gamesProvider.filteredGames[index].playerColor,
                          gamesProvider.filteredGames[index].userNick,
                          gamesProvider.filteredGames[index].opponentUserName,
                          gamesProvider.filteredGames[index].chessType,
                          gamesProvider.filteredGames[index].convertedChessTime,
                          gamesProvider.filteredGames[index].image,
                          gamesProvider.filteredGames[index].whiteResult,
                          gamesProvider.filteredGames[index].blackResult,
                          gamesProvider.filteredGames[index].whoWin,
                        ),
                      ):Padding(
                        padding: const EdgeInsets.symmetric(horizontal:48,vertical: 16),
                        child: Text('You don\'t play any ${Provider.of<ChessDataProvider>(context, listen: false).currentCheckedStats} chess games in this month',style: TextStyle(
                          color: theme.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),textAlign: TextAlign.center,),
                      ),
                    )
                  ],
                ),
              ),
            )
          : Center(child: Text("BRAK DANYCH")),
    );
  }

  void changeStats(BuildContext context, String statsName) {
    Provider.of<ChessDataProvider>(context, listen: false).changeStats(statsName);
    Provider.of<GamesProvider>(context, listen: false).filterGames(statsName);
  }
}
