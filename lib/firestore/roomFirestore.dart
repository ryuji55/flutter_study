import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_study/firestore/userFirestore.dart';

class RoomFirestore {
  static final FirebaseFirestore _firebaseFirestoreInstance =
      FirebaseFirestore.instance;
  static final _roomsCollection =
      _firebaseFirestoreInstance.collection('rooms');

  static Future<void> createRoom(String myUuid) async {
    try {
      final users = await UserFirestore.fetchUsers();
      if (users == null) {
        return;
      }
      users.forEach((user) async {
        if (user.id == myUuid) {
          return;
        }
        await _roomsCollection.add({
          'joinedUserId': [myUuid, user.id],
          'createdTime': Timestamp.now(),
        });
      });
    } catch (e) {
      print('ルームの作成に失敗しました: $e');
    }
  }
}
