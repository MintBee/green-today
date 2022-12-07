import 'package:green_today/domain/event.dart';
import 'package:green_today/repo/EventRepository.dart';

class EventMapper {
  static toDomain(EventEntity eventEntity) {
    return Event(
        startTime: eventEntity.from!,
        endTime: eventEntity.to!,
        subject: eventEntity.title!);
  }

  static toEntity(Event event) {
    return EventEntity(
        event.startTime, event.endTime, event.subject, event.achievementRate);
  }
}
