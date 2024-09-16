import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_study/firestore/roomFirestore.dart';
import 'package:flutter_study/model/user.dart';
import 'package:flutter_study/utils/sharedPrefs.dart';

class UserFirestore {
  static final FirebaseFirestore _firebaseFirestoreInstance =
      FirebaseFirestore.instance;
  static final _usersCollection =
      _firebaseFirestoreInstance.collection('users');

  static Future<DocumentReference?> insertNewAccount() async {
    try {
      final user = await _usersCollection.add({
        'name': 'ナナシさん',
        'imageUrl':
            'https://yt3.googleusercontent.com/ngVd2-zv5o3pGUCfiVdZXCHhnq_g1Lo1Y8DbrmB9O8G7DG0IWUQJgsacqsI_LRvZE8JTsbQIuQ=s900-c-k-c0x00ffffff-no-rj',
      });

      print('ユーザーを作成しました');
      return user;
    } catch (e) {
      print('ユーザーの作成に失敗しました: $e');
      return null;
    }
  }

  static Future<void> createUser() async {
    final user = await UserFirestore.insertNewAccount();
    final String? uuid = user?.id;
    if (uuid == null) {
      return;
    }
    await RoomFirestore.createRoom(uuid);
    await SharedPrefs.setUuid(uuid);
  }

  static Future<List<QueryDocumentSnapshot>?> fetchUsers() async {
    try {
      final users = await _usersCollection.get();
      users.docs.forEach((user) => print(user.data()));
      return users.docs;
    } catch (e) {
      print('ユーザーの取得に失敗しました: $e');
      return null;
    }
  }

  static Future<User?> fetchMyUser() async {
    try {
      final String? uuid = await SharedPrefs.getUuid();
      if (uuid == null) {
        throw ('自分のuuidが取得できませんでした');
      }
      final fetchedUser = await _usersCollection.doc(uuid).get();
      User user = User(
          name: fetchedUser['name'],
          imageUrl: fetchedUser['imageUrl'],
          uuid: uuid);
      return user;
    } catch (e) {
      print('自分のユーザ情報の取得に失敗しました: $e');
      return null;
    }
  }
}
