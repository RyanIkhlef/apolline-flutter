enum TimeFilter {
  MAP_SYNC_1_MIN,
  MAP_SYNC_5_MIN,
  MAP_SYNC_15_MIN,
  MAP_SYNC_30_MIN,
  MAP_SYNC_1_HOUR,
  MAP_SYNC_3_HOUR,
  MAP_SYNC_6_HOUR,
  MAP_SYNC_12_HOUR,
  MAP_SYNC_24_HOUR,
  MAP_SYNC_TODAY,
  MAP_SYNC_THIS_WEEK,
}

extension TimeFilterUtils on TimeFilter {
  int _getMinutesForToday () {
    DateTime now = DateTime.now();
    return now.hour*60 + now.minute;
  }

  int toMinutes () {
    switch (this) {
      case TimeFilter.MAP_SYNC_1_MIN:
        return 1;
      case TimeFilter.MAP_SYNC_5_MIN:
        return 5;
      case TimeFilter.MAP_SYNC_15_MIN:
        return 15;
      case TimeFilter.MAP_SYNC_30_MIN:
        return 30;
      case TimeFilter.MAP_SYNC_1_HOUR:
        return 60;
      case TimeFilter.MAP_SYNC_3_HOUR:
        return 180;
      case TimeFilter.MAP_SYNC_6_HOUR:
        return 360;
      case TimeFilter.MAP_SYNC_12_HOUR:
        return 720;
      case TimeFilter.MAP_SYNC_24_HOUR:
        return 1440;
      case TimeFilter.MAP_SYNC_TODAY:
        return this._getMinutesForToday();
      case TimeFilter.MAP_SYNC_THIS_WEEK:
        DateTime now = DateTime.now();
        return (now.weekday - 1) * 24 * 60 + this._getMinutesForToday();
    }
  }
}