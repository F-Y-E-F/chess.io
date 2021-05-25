import 'package:chess_io/data/models/player_data.dart';
import 'package:chess_io/ui/widgets/chess_type_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final playerData = ModalRoute.of(context).settings.arguments as PlayerData;
    return Scaffold(
      body: SafeArea(
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
              margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 40),
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                        Text("Current Ranking",style: TextStyle(color: Colors.grey[500],fontSize: 15),),
                        Text("831",style: theme.textTheme.headline1,),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
