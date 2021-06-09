import 'package:flutter/material.dart';

class ChessTimeCategoryCard extends StatelessWidget {
  final String title;
  final String image;

  ChessTimeCategoryCard(this.title, this.image);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
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
