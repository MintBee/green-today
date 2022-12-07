import 'dart:ui';

import 'package:green_today/palette.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventDataSource<Event> extends CalendarDataSource<Event> {
  EventDataSource(List<Event> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  Color getColor(int index) {
    int roundedRate = (appointments![index].toDouble() / 10).round();
    return GreenPicker.getGreenFor(roundedRate);
  }

  @override
  String getSubject(int index) {
    return appointments![index].title;
  }
}

class Event {
  Event(
      {required this.from,
      required this.to,
      this.title = '',
      this.achievementRate = 0});

  DateTime from;
  DateTime to;
  String title;
  int achievementRate;
}
