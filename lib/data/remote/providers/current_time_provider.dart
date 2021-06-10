

import 'package:flutter/foundation.dart';

class CurrentTimeProvider with ChangeNotifier{

    int _time;
    int _incrementTime;

    int get time => _time;
    int get incrementTime => _incrementTime;


    void setTimes(int timeToSet,int incrementTimeToSet){
      _time = timeToSet;
      _incrementTime = incrementTimeToSet;
      notifyListeners();
    }
}