import 'package:chess_io/data/models/game.dart';
import 'package:chess_io/data/remote/providers/games_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BestWorstGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bestGame = Provider.of<GamesProvider>(context).bestGame;
    final worstGame = Provider.of<GamesProvider>(context).worstGame;

    return  Column(
      children: [
        if(bestGame!=null)  _cardGameItem(bestGame, "Best win"),
        if(worstGame!=null) _cardGameItem(worstGame, "Worst loss"),
      ],
    );
  }

  Widget _cardGameItem(Game game, String title) => Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
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
                  style:
                      GoogleFonts.lato(color: Colors.grey[500], fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 5),
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(2)),
                            ),
                            Text(game.playerColor == 'white'
                                ? game.userNick
                                : game.opponentUserName),
                            Text(game.playerColor == 'white'
                                ? " (" + game.userRating.toString() + ") "
                                : " (" + game.opponentRating.toString() + ") "),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 5),
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(2)),
                            ),
                            Text(game.playerColor == 'black'
                                ? game.userNick
                                : game.opponentUserName),
                            Text(game.playerColor == 'black'
                                ? " (" + game.userRating.toString() + ") "
                                : " (" + game.opponentRating.toString() + ") "),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    game.whoWin == WinType.PLAYER_WIN
                        ? Icon(
                            Icons.add_box_rounded,
                            color: const Color(0xff29b400),
                          )
                        : Icon(
                            Icons.indeterminate_check_box,
                            color: Colors.red[600],
                          ),
                    SizedBox(
                      width: 10,
                    ),
                    Spacer(),
                    Text(
                      DateFormat.MMMd().format(
                          DateTime.fromMillisecondsSinceEpoch(
                              game.time * 1000)),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
