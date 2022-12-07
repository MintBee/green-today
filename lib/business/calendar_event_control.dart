import 'package:green_today/domain/EventDataSource.dart';
import 'package:green_today/domain/event.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../repo/EventRepository.dart';


class EventController {
  final EventDataSource _dataSource;
  late final List<dynamic> _appointments;
  //TODO final EventRepository _eventRepository = EventRepository();

  EventController(this._dataSource) {
    _dataSource.appointments ??= [];
    _appointments = _dataSource.appointments!;
  }

  EventDataSource get dataSource => _dataSource;

  Future<void> addEvent(Event event) async {
    _appointments.add(event);
    _dataSource.notifyListeners(CalendarDataSourceAction.add, _dataSource
        .appointments!);

  }

  Future<void> removeEvent(Event event) async {
    _appointments.remove(event);
    _dataSource.notifyListeners(CalendarDataSourceAction.remove, _dataSource
        .appointments!);

  }

  EventEntity getEvent(CalendarTapDetails details) {
    return details.appointments![0];
  }

  // TODO Future<void> loadMonthEvents(DateTime monthDate) async {
  //
  //   List<Event> events = await _eventRepository.getInMonth(monthDate);
  //   _appointments.addAll(events);
  //   _dataSource.notifyListeners(CalendarDataSourceAction.add, _dataSource
  //       .appointments!);
  // }
}