import 'dart:io';

import 'package:chess_io/data/models/player_data.dart';
import 'package:chess_io/data/remote/fetch_chess_data.dart';
import 'package:chess_io/data/remote/providers/chess_data_provider.dart';
import 'package:chess_io/ui/helpers/custom_page_transition.dart';
import 'package:chess_io/ui/helpers/dialogs.dart';
import 'package:chess_io/ui/helpers/snacks.dart';
import 'package:chess_io/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputNicknameScreen extends StatelessWidget {
  final _nickTextController = TextEditingController();
  final _focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
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
                    style: theme.textTheme.headline1
                        .copyWith(color: Colors.red[600]),
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
              controller: _nickTextController,
              focusNode: _focus,
              cursorColor: theme.primaryColor,
              decoration: InputDecoration(labelText: 'Enter Your Nickname'),
              onSubmitted: (val) async => await submitRequest(context),
            ),
            Container(
                padding: const EdgeInsets.only(top: 15),
                width: double.infinity,
                child: TextButton(
                  onPressed: () async {
                    _focus.unfocus();
                    await submitRequest(context);
                  },
                  child: Text("Go inside!"),
                ))
          ],
        ),
      ),
    );
  }

  Future<void> submitRequest(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) => Dialogs().getLoadingDialog(),
        barrierDismissible: false);
    try {
      final provider = Provider.of<ChessDataProvider>(context, listen: false);
      await provider.setData(_nickTextController.text);
      await provider.setStats(_nickTextController.text);

      Navigator.of(context).pop();
      Navigator.of(context).push(CustomPageTransition(
          page: HomeScreen(), transitionType: PageTransitions.SCALE));
    } on SocketException {
      Navigator.of(context).pop();
      Snacks.showSnack("Check your internet connection", context);
    } catch (e) {
      Navigator.of(context).pop();
      Snacks.showSnack(e.toString(), context);
      print(e);
    }
  }
}
