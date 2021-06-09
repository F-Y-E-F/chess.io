import 'package:chess_io/data/models/chess_time/chess_time.dart';

class ChessTimeCategory {
  String title;
  String image;
  List<ChessTime> basicChessTimes;

  ChessTimeCategory(this.title, this.image, this.basicChessTimes);

  static List<ChessTimeCategory> getAllCategories() {
    return [
      ChessTimeCategory("Bullet", 'assets/images/bullet.png', [
        ChessTime(1, 0),
        ChessTime(1, 1),
        ChessTime(1, 2),
        ChessTime(2, 0),
        ChessTime(2, 1),
        ChessTime(3, 0)
      ]),
      ChessTimeCategory("Blitz", 'assets/images/blitz.png',  [
        ChessTime(3, 0),
        ChessTime(3, 2),
        ChessTime(5, 0),
        ChessTime(5, 3),
        ChessTime(5, 5),
      ]),
      ChessTimeCategory("Rapid", 'assets/images/rapid.png', [
        ChessTime(10, 0),
        ChessTime(10, 5),
        ChessTime(15,10),
      ]),
      ChessTimeCategory("Classic", 'assets/images/classic.png',  [
        ChessTime(30, 0),
        ChessTime(30, 20),
        ChessTime(60, 0),
        ChessTime(60, 30),
      ]),
    ];
  }
}
