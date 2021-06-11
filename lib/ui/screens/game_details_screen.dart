import 'package:chess_io/data/models/game.dart';
import 'package:chess_io/data/remote/providers/games_provider.dart';
import 'package:chess_io/helpers/ad_state.dart';
import 'package:chess_io/ui/helpers/snacks.dart';
import 'package:chess_io/ui/widgets/one_data_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class GameDetailsScreen extends StatefulWidget {
  final int date;

  GameDetailsScreen(this.date);

  @override
  _GameDetailsScreenState createState() => _GameDetailsScreenState();
}

class _GameDetailsScreenState extends State<GameDetailsScreen> {


  //ads
  BannerAd _bannerAd;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    if(_bannerAd==null){
      adState.initialization.then((status) {
        setState(() {
          _bannerAd = BannerAd(size: AdSize.banner,
              adUnitId: adState.testBannerId,
              listener: adState.adListener,
              request: AdRequest())..load();
        });
      });
    }
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Game game = Provider.of<GamesProvider>(context).getGameByTime(
        widget.date);
    final theme = Theme.of(context);
    return Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  if (_bannerAd != null)
                    Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        width: _bannerAd.size.width.toDouble(),
                        height: _bannerAd.size.height.toDouble(),
                        child: AdWidget(ad: _bannerAd),
                      ),
                    )
                  else Container(width: 320,height: 50,),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        game.image,
                        height: 35,
                        color: game.image == 'assets/images/rapid.png'
                            ? Colors.green
                            : Colors.amber,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${toBeginningOfSentenceCase(game.chessType)} Chess",
                        style: theme.textTheme.headline4
                            .copyWith(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
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
                              "You ${game.whoWin == WinType.PLAYER_WIN
                                  ? 'won'
                                  : 'loss'} \nBy ${game.winType}",
                              style: GoogleFonts.lato(
                                  color: theme.primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
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
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 2),
                                              borderRadius:
                                              BorderRadius.circular(2)),
                                        ),
                                        Text(game.playerColor == 'white'
                                            ? game.userNick
                                            : game.opponentUserName),
                                        Text(game.playerColor == 'white'
                                            ? " (" +
                                            game.userRating.toString() +
                                            ") "
                                            : " (" +
                                            game.opponentRating.toString() +
                                            ") "),
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
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 2),
                                              borderRadius:
                                              BorderRadius.circular(2)),
                                        ),
                                        Text(game.playerColor == 'black'
                                            ? game.userNick
                                            : game.opponentUserName),
                                        Text(game.playerColor == 'black'
                                            ? " (" +
                                            game.userRating.toString() +
                                            ") "
                                            : " (" +
                                            game.opponentRating.toString() +
                                            ") "),
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
                                          widget.date * 1000)),
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
                  ),
                  SizedBox(height: 10),
                  OneDataCard(
                      'Date',
                      DateFormat('MMM dd').format(
                          DateTime.fromMillisecondsSinceEpoch(
                              game.time * 1000))),
                  OneDataCard(
                      'Time',
                      DateFormat('hh:mm').format(
                          DateTime.fromMillisecondsSinceEpoch(
                              game.time * 1000))),
                  OneDataCard('Chess Time', game.convertedChessTime),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Colors.orange[400],
                            Colors.orange[900],
                          ],
                        )),
                    child: TextButton(
                      onPressed: () {
                        try {
                          _launchURL(game.url);
                        } catch (e) {
                          Snacks.showSnack(e, context);
                        }
                      },
                      child: Text("Full Game Analysis"),
                      style:
                      TextButton.styleFrom(backgroundColor: Colors.transparent),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> _launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
