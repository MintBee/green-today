import 'package:green_today/domain/EventDataSource.dart';

class EventRepository {
  EventRepository();

  Future<void> add(Event event) async {

  }

  // Future<Event> get(DateTime dateTime) async {
  //
  // }

  Stream<Event> getInDay(DateTime day) async* {

  }

  Stream<Event> getInMonth(DateTime month) async* {

  }
}