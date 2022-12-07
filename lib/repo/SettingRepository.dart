import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../consts.dart';
import '../domain/setting.dart' as domain_setting;
import '../domain/time.dart';

class SettingsRepository {
  final FirebaseFirestore _storeInstance = FirebaseFirestore.instance;
  late final String _uid;
  final DateFormat dateFormat = DateConst.formatter;

  SettingsRepository() {
    if (AuthConst.uid == null) {
      _storeInstance.useFirestoreEmulator('localhost', 9099);
      _uid = AuthConst.uid!;
    }
  }

  Future<domain_setting.Settings> get() async {
    final notiTimeDoc = await _getNotiTimeDocRef().get();
    final newMorningTime =
        SimpleTime.fromJson(notiTimeDoc.get('morning_noti_time'));
    final newEveningTime =
        SimpleTime.fromJson(notiTimeDoc.get('morning_noti_time'));
    return domain_setting.Settings(newMorningTime, newEveningTime);
  }

  Future<void> update(domain_setting.Settings settings) async {
    final notiTimeDocRef = _getNotiTimeDocRef();
    await notiTimeDocRef.set(
        {'morning_noti_time': settings.morningNotiTime.json},
        SetOptions(merge: true));
    await notiTimeDocRef.set(
        {'evening_noti_time': settings.eveningNotiTime.json},
        SetOptions(merge: true));
  }

  DocumentReference _getNotiTimeDocRef() {
    return _storeInstance
        .collection('users')
        .doc(_uid)
        .collection('settings')
        .doc('noti_time');
  }
}
