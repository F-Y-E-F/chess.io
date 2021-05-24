import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class InputNicknameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Chess',
                    style: theme.textTheme.headline1,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '.io',
                    style: theme.textTheme.headline1.copyWith(color: Colors.red[600]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: Text(
                'Improve your chess game',
                style: theme.textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              padding: const EdgeInsets.only(bottom: 30),
            ),
            TextField(
              cursorColor: theme.primaryColor,
              decoration: InputDecoration(labelText: 'Enter Your Nickname'),
            ),
            Container(
                padding: const EdgeInsets.only(top: 15),
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: Text("Go inside!"),
                ))
          ],
        ),
      ),
    );
  }
}
