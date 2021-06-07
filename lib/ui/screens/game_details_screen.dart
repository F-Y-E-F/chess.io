import 'package:chess_io/main.dart';
import 'package:flutter/material.dart';
import 'package:chess/chess.dart' as ch;

import 'package:flutter_stateless_chessboard/flutter_stateless_chessboard.dart' as cb;

class GameDetailsScreen extends StatefulWidget {
  @override
  _GameDetailsScreenState createState() => _GameDetailsScreenState();
}

class _GameDetailsScreenState extends State<GameDetailsScreen> {

  String fen = 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1';
  ch.Chess chess = ch.Chess();

  void makeChess() async {
    chess.load_pgn(
        "[Event \"Live Chess\"]\n[Site \"Chess.com\"]\n[Date \"2009.10.29\"]\n[Round \"-\"]\n[White \"mynd_zye\"]\n[Black \"erik\"]\n[Result \"1-0\"]\n[CurrentPosition \"2R5/8/2p5/8/6p1/3k2P1/6K1/8 b - -\"]\n[Timezone \"UTC\"]\n[ECO \"B06\"]\n[ECOUrl \"https://www.chess.com/openings/Modern-Defense-with-1-e4-2.d4-d6-3.Nc3\"]\n[UTCDate \"2009.10.29\"]\n[UTCTime \"23:45:51\"]\n[WhiteElo \"1396\"]\n[BlackElo \"1653\"]\n[TimeControl \"120+1\"]\n[Termination \"mynd_zye won on time\"]\n[StartTime \"23:45:51\"]\n[EndDate \"2009.10.29\"]\n[EndTime \"23:51:23\"]\n[Link \"https://www.chess.com/game/live/3398\"]\n\n1. e4 {[%clk 0:02:00]} 1... d6 {[%clk 0:02:00]} 2. d4 {[%clk 0:01:57.6]} 2... g6 {[%clk 0:02:00.8]} 3. Nc3 {[%clk 0:01:56]} 3... Bg7 {[%clk 0:02:01.8]} 4. f4 {[%clk 0:01:55.3]} 4... Nf6 {[%clk 0:02:01.1]} 5. Nf3 {[%clk 0:01:53.3]} 5... O-O {[%clk 0:02:00.7]} 6. Bd3 {[%clk 0:01:51.2]} 6... c6 {[%clk 0:02:00.8]} 7. O-O {[%clk 0:01:51]} 7... b5 {[%clk 0:02:01.2]} 8. a3 {[%clk 0:01:49.7]} 8... Bb7 {[%clk 0:02:01.5]} 9. Be3 {[%clk 0:01:49]} 9... Nbd7 {[%clk 0:02:01.8]} 10. Qd2 {[%clk 0:01:48.4]} 10... Qe8 {[%clk 0:02:02]} 11. f5 {[%clk 0:01:47.8]} 11... e5 {[%clk 0:02:00.8]} 12. fxe6 {[%clk 0:01:42]} 12... fxe6 {[%clk 0:02:00]} 13. Bh6 {[%clk 0:01:42]} 13... d5 {[%clk 0:01:56]} 14. Bxg7 {[%clk 0:01:40]} 14... Kxg7 {[%clk 0:01:55.8]} 15. e5 {[%clk 0:01:39.4]} 15... Nh5 {[%clk 0:01:54]} 16. Ng5 {[%clk 0:01:35.9]} 16... Kg8 {[%clk 0:01:15.7]} 17. Rxf8+ {[%clk 0:01:25.7]} 17... Kxf8 {[%clk 0:00:55.6]} 18. Rf1+ {[%clk 0:01:23.3]} 18... Kg8 {[%clk 0:00:55.2]} 19. Ne2 {[%clk 0:01:15.2]} 19... Nf8 {[%clk 0:00:48.6]} 20. Nf4 {[%clk 0:01:08.2]} 20... Bc8 {[%clk 0:00:45.3]} 21. Nxh5 {[%clk 0:01:06]} 21... gxh5 {[%clk 0:00:44.5]} 22. Qf4 {[%clk 0:00:54.8]} 22... Ng6 {[%clk 0:00:40.9]} 23. Qf7+ {[%clk 0:00:47.1]} 23... Qxf7 {[%clk 0:00:37]} 24. Rxf7 {[%clk 0:00:45.5]} 24... h6 {[%clk 0:00:32.3]} 25. Bxg6 {[%clk 0:00:42]} 25... hxg5 {[%clk 0:00:31.7]} 26. Rc7 {[%clk 0:00:39]} 26... h4 {[%clk 0:00:29.4]} 27. g3 {[%clk 0:00:38.5]} 27... Rb8 {[%clk 0:00:22.8]} 28. Rxa7 {[%clk 0:00:36.2]} 28... hxg3 {[%clk 0:00:22]} 29. hxg3 {[%clk 0:00:34.5]} 29... b4 {[%clk 0:00:22.6]} 30. axb4 {[%clk 0:00:32.2]} 30... Rxb4 {[%clk 0:00:19.3]} 31. Ra8 {[%clk 0:00:30.9]} 31... Kg7 {[%clk 0:00:19.6]} 32. Rxc8 {[%clk 0:00:26.6]} 32... Kxg6 {[%clk 0:00:19.3]} 33. b3 {[%clk 0:00:26.7]} 33... Rb6 {[%clk 0:00:18.9]} 34. Kg2 {[%clk 0:00:26.7]} 34... Kh5 {[%clk 0:00:19.2]} 35. Kh3 {[%clk 0:00:24]} 35... g4+ {[%clk 0:00:19.6]} 36. Kh2 {[%clk 0:00:22]} 36... Kg5 {[%clk 0:00:19.9]} 37. Rg8+ {[%clk 0:00:21.3]} 37... Kf5 {[%clk 0:00:20.3]} 38. Rh8 {[%clk 0:00:20.6]} 38... Ke4 {[%clk 0:00:20.3]} 39. Rh6 {[%clk 0:00:16.8]} 39... Kxd4 {[%clk 0:00:20.1]} 40. Rxe6 {[%clk 0:00:16.7]} 40... Ke4 {[%clk 0:00:19.9]} 41. Kg2 {[%clk 0:00:16.5]} 41... d4 {[%clk 0:00:16.9]} 42. Re8 {[%clk 0:00:15.8]} 42... d3 {[%clk 0:00:17.2]} 43. cxd3+ {[%clk 0:00:14.6]} 43... Kxd3 {[%clk 0:00:17.7]} 44. e6 {[%clk 0:00:13.9]} 44... Rxb3 {[%clk 0:00:17]} 45. e7 {[%clk 0:00:14.3]} 45... Kc4 {[%clk 0:00:16.7]} 46. Rd8 {[%clk 0:00:13.7]} 46... Re3 {[%clk 0:00:16.6]} 47. e8=Q {[%clk 0:00:12.6]} 47... Rxe8 {[%clk 0:00:17.6]} 48. Rxe8 {[%clk 0:00:12.8]} 48... Kd3 {[%clk 0:00:17.8]} 49. Rc8 {[%clk 0:00:12]} 1-0\n");

    setState(() {
      fen = chess.fen;
    });
  }

  void makeMove(){
    var moves = chess.moves();
    var move = moves[0];
    chess.move(move);
    setState(() {
      fen = chess.fen;
    });
  }

  @override
  void initState() {
    super.initState();
    makeChess();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          cb.Chessboard(
            size: 300,
            fen: fen,
            onMove: (move) { // optional
              makeMove();
            },
            orientation: cb.Color.BLACK,
            lightSquareColor: Color.fromRGBO(240, 217, 181, 1),
            darkSquareColor: Color.fromRGBO(181, 136, 99, 1), // optional

          ),
        ],
      ),
    );
  }
}

