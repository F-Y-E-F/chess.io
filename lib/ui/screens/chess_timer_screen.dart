import 'dart:async';

import 'package:chess_io/data/remote/providers/current_time_provider.dart';
import 'package:chess_io/ui/helpers/custom_page_transition.dart';
import 'package:chess_io/ui/screens/chess_timer_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pausable_timer/pausable_timer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChessTimerScreen extends StatefulWidget {
  @override
  _ChessTimerScreenState createState() => _ChessTimerScreenState();
}

class _ChessTimerScreenState extends State<ChessTimerScreen>
    with TickerProviderStateMixin {
  //NAVIGATION
  int rotate = 0;
  bool isPlaying = false;
  bool isWhiteSite = true;

  //==========

  //ANIMS
  AnimationController _playPauseController;
  AnimationController _rotationController;
  AnimationController _refreshRotationController;
  //=====

  //TIMERS
  PausableTimer _whiteTimer;
  var _whiteCountDown = 600;

  PausableTimer _blackTimer;
  var _blackCountDown = 600;

  bool _isBlackLastPaused = false;
  int incrementTime = 0;
  //=====

  @override
  void initState() {
    _setupTimes();
    _whiteTimer = PausableTimer(
      Duration(seconds: 1),
      () {
        setState(() {
          _whiteCountDown--;
        });
        if (_whiteCountDown > 0) {
          _whiteTimer
            ..reset()
            ..start();
        }
      },
    );
    _blackTimer = PausableTimer(
      Duration(milliseconds: 1000),
      () {
        setState(() {
          _blackCountDown--;
        });
        if (_blackCountDown > 0) {
          _blackTimer
            ..reset()
            ..start();
        }
      },
    );
    _playPauseController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    _rotationController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    _refreshRotationController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _playPauseController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RotatedBox(
            quarterTurns: rotate,
            child: Column(
              children: [
                Expanded(
                    child: InkWell(
                  onTap: _isBlackLastPaused ? _onChangeUserTimerClick : null,
                  child: Ink(
                    width: double.infinity,
                    color: Colors.black,
                    child: Center(
                        child: RotatedBox(
                      quarterTurns: 2,
                      child: Text(
                        format(Duration(seconds: _blackCountDown)),
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 84,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                  ),
                )),
                Expanded(
                    child: InkWell(
                  onTap: !_isBlackLastPaused ? _onChangeUserTimerClick : null,
                  child: Ink(
                    width: double.infinity,
                    color: Colors.white,
                    child: Center(
                        child: Text(
                      format(Duration(seconds: _whiteCountDown)),
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 84,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                )),
              ],
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 4),
                    ),
                    child: IconButton(
                        iconSize: 45,
                        icon: Icon(
                          Icons.settings,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(CustomPageTransition(page: ChessTimerSettings())).then((value) => _resetTimers());
                        })),
                Container(
                  child: IconButton(
                    iconSize: 45,
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.play_pause,
                      progress: _playPauseController,
                    ),
                    onPressed: _handleOnPressedPlayPause,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 4),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 4),
                    ),
                    child: RotationTransition(
                      turns: Tween(begin:0.0,end: 1.0).animate(_refreshRotationController),
                      child: IconButton(
                          iconSize: 45,
                          icon: Icon(
                            Icons.refresh,
                            color: Colors.black,
                          ),
                          onPressed: _resetTimers),
                    )),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 4),
                  ),
                  child: RotationTransition(
                      turns: Tween(begin: 0.0, end: 0.5)
                          .animate(_rotationController),
                      child: IconButton(
                        iconSize: 45,
                        icon: Icon(
                          Icons.wifi_protected_setup,
                          color: Colors.black,
                        ),
                        onPressed: _handleOnChangeSites,
                      )),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onChangeUserTimerClick() {
    if (!(_whiteTimer.isPaused && _blackTimer.isPaused)) {
      if (_whiteTimer.isPaused) {
        _whiteTimer.start();
        _blackTimer.pause();
        setState(() {
          _isBlackLastPaused = false;
          _blackCountDown+=incrementTime;
        });

      } else {
        _whiteTimer.pause();
        _blackTimer.start();
        setState(() {
          _isBlackLastPaused = true;
          _whiteCountDown+=incrementTime;
        });
      }
    }
  }

  void _handleOnPressedPlayPause() {
    if (_whiteTimer.isPaused && _blackTimer.isPaused) {
      if (!_isBlackLastPaused)
        _whiteTimer.start();
      else
        _blackTimer.start();
    } else {
      _whiteTimer.pause();
      _blackTimer.pause();
    }

    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _playPauseController.forward()
          : _playPauseController.reverse();
    });
  }

  void _handleOnChangeSites() {
    setState(() {
      rotate == 0 ? rotate = 2 : rotate = 0;
      rotate == 2
          ? _rotationController.forward()
          : _rotationController.reverse();
    });
  }

  format(Duration d) => d.inSeconds >= 3600 ? d.toString().substring(0, 7) : d.toString().substring(2, 7);

  void _resetTimers() {
    _refreshRotationController.forward().whenComplete(() => _refreshRotationController.reset());
    _isBlackLastPaused = false;
    _whiteTimer.pause();
    _blackTimer.pause();
    _setupTimes();
    setState(() {
      isPlaying = false;
      isPlaying
          ? _playPauseController.forward()
          : _playPauseController.reverse();
    });
  }

  Future<void> _setupTimes() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final time = prefs.getInt('time') ?? 600;
    incrementTime = prefs.getInt('incrementTime') ?? 0;
    Provider.of<CurrentTimeProvider>(context,listen: false).setTimes(time~/60, incrementTime);
    setState(() {
      _whiteCountDown = time;
      _blackCountDown = time;
    });
  }
}
