import 'package:chess_io/data/remote/providers/chess_data_provider.dart';
import 'package:chess_io/data/remote/providers/current_time_provider.dart';
import 'package:chess_io/data/remote/providers/games_provider.dart';
import 'package:chess_io/helpers/ad_state.dart';
import 'package:chess_io/ui/screens/input_nickname_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);
  runApp(Provider.value(value: adState, builder: (context, child) => MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => ChessDataProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => GamesProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => CurrentTimeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                color: Colors.white,
                centerTitle: true,
                iconTheme: IconThemeData(
                  color: const Color(0xff0D0221), //change your color here
                ),
                elevation: 1),
            scaffoldBackgroundColor: const Color(0xffefefef),
            primaryColor: const Color(0xff0D0221),
            accentColor: Colors.red[600],
            textTheme: GoogleFonts.openSansTextTheme().copyWith(
              headline1: GoogleFonts.lato(
                  textStyle: TextStyle(color: const Color(0xff0D0221)),
                  fontSize: 52,
                  fontWeight: FontWeight.w600),
              headline2: GoogleFonts.lato(
                  textStyle: TextStyle(color: const Color(0xff0D0221)),
                  fontSize: 36,
                  fontWeight: FontWeight.w600),
              headline3:
                  GoogleFonts.lato(textStyle: TextStyle(color: Colors.red)),
              headline4: GoogleFonts.lato(
                  textStyle: TextStyle(color: const Color(0xff0D0221)),
                  fontSize: 20),
              headline5:
                  GoogleFonts.lato(textStyle: TextStyle(color: Colors.red)),
              headline6: GoogleFonts.lato(
                  textStyle: TextStyle(color: Colors.grey[400], fontSize: 18)),
            ),
            inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(color: const Color(0xff0D0221)),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: const Color(0xff0D0221), width: 2)),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: const Color(0xff0D0221), width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: const Color(0xff0D0221), width: 2))),
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    backgroundColor: const Color(0xff0D0221),
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    primary: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 20))),
            snackBarTheme: SnackBarThemeData(
              backgroundColor: const Color(0xff0D0221),
              behavior: SnackBarBehavior.floating,
            )),
        home: InputNicknameScreen(),
      ),
    );
  }
}
