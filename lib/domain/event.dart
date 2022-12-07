import 'package:syncfusion_flutter_calendar/calendar.dart';

class Event extends Appointment {
  Event(
      {required super.startTime,
      required super.endTime,
      super.subject,
      this.achievementRate = 0})
      : super();

  int achievementRate;
}

