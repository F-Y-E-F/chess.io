
class ChessTimeCategory{

  String title;
  String image;

  ChessTimeCategory(this.title,this.image);

   static List<ChessTimeCategory> getAllCategories(){
    return [
      ChessTimeCategory("Bullet", 'assets/images/bullet.png'),
      ChessTimeCategory("Blitz", 'assets/images/blitz.png'),
      ChessTimeCategory("Rapid", 'assets/images/rapid.png'),
      ChessTimeCategory("Classic", 'assets/images/classic.png'),
    ];
  }

}