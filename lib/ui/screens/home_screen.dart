import 'package:chess_io/data/models/player_data.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final playerData = ModalRoute.of(context).settings.arguments as PlayerData;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(playerData.avatar),
            Text(playerData.name),
            Text(playerData.userName),
            Text('Dołaczył : ${DateTime.fromMillisecondsSinceEpoch(playerData.joined * 1000)}'),
            Text('Ostatnio widziany : ${DateTime.fromMillisecondsSinceEpoch(playerData.lastOnline * 1000)}'),
          ],
        ),
      ),
    );
  }
}
