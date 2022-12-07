// TODO import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:green_today/domain/EventDataSource.dart';
// import 'package:intl/intl.dart';
//
// import '../domain/setting.dart';
//
//
// class EventRepository {
//   EventRepository();
//
//   Future<void> add(EventEntity event) async {
//
//   }
//
//   Future<EventEntity> get(DateTime dateTime) async {
//
//   }
//
//   Future<List<EventEntity>> getInDay(DateTime day) async {
//
//   }
//
//   Future<List<EventEntity>> getInMonth(DateTime month) async {
//
//   }
//
//   Future<void> update(String date, String review,List<EventEntity> event) async {
//     FirebaseFirestore.instance.collection('users').doc().collection('dates').doc(date).update({
//       'dayReview' : review,
//       'List<Event>' : event,
//     });
//   }
//
//   Future<void> delete(EventEntity event) async {
//     FirebaseFirestore.instance.collection('users').doc().collection('dates').doc(date).delete();
//   }
// }
//
// class SettingRepository {
//   Future<void> createSetting(Setting setting) async {
//     FirebaseFirestore.instance.collection('users').doc().collection('settings').doc(setting.userid).set({'setting' : setting});
//   }
//
//   Future<Setting> getSetting(Setting setting) async {
//     final currentSetting = await FirebaseFirestore.instance.collection('users').doc().collection('settings').doc(setting.userid).get();
//     return currentSetting.data()!['setting'];
//   }
//
//   Future<void> updateSetting(Setting setting) async {
//     FirebaseFirestore.instance.collection('users').doc().collection('settings').doc(setting.userid).update({'setting' : setting});
//   }
//
//   Future<void> deleteSetting(Setting setting) async {
//     FirebaseFirestore.instance.collection('users').doc().collection('dates').doc(setting.userid).delete();
//   }
// }
//
// class EventRepository{
//   Future<void> createEvent(DateTime dateTime, String review,List<EventEntity> event) async {
//     DateFormat('yy/MM/dd').format(dateTime);
//     FirebaseFirestore.instance.collection('users').doc().collection('dates')
//         .doc(dateTime).set({
//       'dayReview' : review,
//       'List<Event>' : event,
//     });
//   }
//
//   Future<List<EventEntity>> getEvent(DateTime date) async {
//     DateFormat('yy/MM/dd').format(date);
//     final currentEvent = await FirebaseFirestore.instance.collection('users').doc().collection('dates').doc(date).get();
//     return currentEvent.data()!['List<Event>'];
//   }
//
//   Future<void> updateEvent(DateTime date, String review,List<EventEntity> event) async {
//     DateFormat('yy/MM/dd').format(date);
//     FirebaseFirestore.instance.collection('users').doc().collection('dates').doc(date).update({
//       'dayReview' : review,
//       'List<Event>' : event,
//     });
//   }
//
//   Future<void> deleteEvent(DateTime date) async {
//     FirebaseFirestore.instance.collection('users').doc().collection('dates').doc(date).delete();
//   }
// }
//
// class TodayReviewRepository {
//   Future<String> getReview(DateTime date) async {
//     DateFormat('yy/MM/dd').format(date);
//     final currentReview = await FirebaseFirestore.instance.collection('users').doc().collection('dates').doc(date).get();
//     return currentReview.data()!['dayReview'];
//   }
// }
//

class EventEntity {
  DateTime? from;
  DateTime? to;
  String? title;
  int? achievementRate;

  EventEntity(this.from, this.to, this.title, this.achievementRate);
}


