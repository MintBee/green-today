import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:green_today/consts.dart';
import 'package:green_today/domain/EventDataSource.dart';
import 'package:green_today/domain/event.dart';
import 'package:intl/intl.dart';

class EventRepository {
  final FirebaseFirestore _storeInstance = FirebaseFirestore.instance;
  late final String _uid;
  final DateFormat dateFormat = DateConst.formatter;

  EventRepository() {
    if (AuthConst.uid == null) {
      _storeInstance.useFirestoreEmulator('localhost', 9099);
      _uid = AuthConst.uid!;
    }
  }

  Future<void> create(Event event) async {
    final date = event.startTime;
    final dateDocumentRef = getDayDocument(date);
    await dateDocumentRef.update({
      'events': FieldValue.arrayUnion([event.json])
    });
  }

  Future<List<Event>> getInDay(DateTime day) async {
    final dateDocument = await getDayDocument(day).get();
    List<dynamic> events = dateDocument.get('events') as List<dynamic>;
    return events
        .map((e) => Event.fromJson(DateConst.formatter.format(day), e))
        .toList();
  }

  Future<List<Event>> getInMonth(DateTime month) async {
    final daysCollection = await getDaysCollection(month).get();
    return daysCollection.docs.fold(<Event>[], (previousList, doc) {
      final List<Event> events = (doc.get('events') as List)
          .map((e) => Event.fromJson(doc.id, e))
          .toList();
      previousList.addAll(events);
      return previousList;
    }).toList();
  }

  Future<void> update(Event prevEvent, Event updatedEvent) async {
    await delete(prevEvent);
    await create(updatedEvent);
  }

  Future<void> delete(Event event) async {
    final dateDocumentRef = getDayDocument(event.startTime);
    final dateDocument = await dateDocumentRef.get();
    List<dynamic> mappedEvents = dateDocument.get('events') as List<dynamic>;
    dynamic removedMappedEvent =
        mappedEvents.where((mappedEvent) => mappedEvent == event.json).first;
    await dateDocumentRef.update({
      'events': FieldValue.arrayRemove([removedMappedEvent])
    });
  }

  CollectionReference getDaysCollection(DateTime date) {
    return _storeInstance
        .collection('users')
        .doc(_uid)
        .collection('events')
        .doc('calendar_events')
        .collection('years')
        .doc('${date.year}')
        .collection('months')
        .doc('${date.month}')
        .collection('days');
  }

  DocumentReference getDayDocument(DateTime date) {
    return getDaysCollection(date).doc(dateFormat.format(date));
  }
}
