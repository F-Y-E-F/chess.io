import 'package:chess_io/data/models/chess_time/chess_time.dart';
import 'package:chess_io/ui/helpers/custom_page_transition.dart';
import 'package:chess_io/ui/screens/chess_category_times.dart';
import 'package:flutter/material.dart';

class ChessTimeCategoryCard extends StatelessWidget {
  final String title;
  final String image;
  final List<ChessTime> times;

  ChessTimeCategoryCard(this.title, this.image,this.times);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(CustomPageTransition(page:ChessCategoryTimes(title,times))),
      child: Card(
        margin: const EdgeInsets.all(7),
        color: Colors.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            image,
            height: 60,
            fit: BoxFit.fill,
            color: image == 'assets/images/classic.png'
                ? Colors.black
                : image == 'assets/images/rapid.png'
                    ? Colors.green
                    : Colors.amber,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
          )
        ]),
      ),
    );
  }
}
