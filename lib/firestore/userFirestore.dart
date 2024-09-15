import 'package:cloud_firestore/cloud_firestore.dart';

class UserFirestore {
  static final FirebaseFirestore _firebaseFirestoreInstance =
      FirebaseFirestore.instance;
  static final _usersCollection =
      _firebaseFirestoreInstance.collection('users');

  static Future<void> createUser() async {
    try {
      await _usersCollection.add({
        'name': 'ナナシさん',
        'imageUrl':
            'https://yt3.googleusercontent.com/ngVd2-zv5o3pGUCfiVdZXCHhnq_g1Lo1Y8DbrmB9O8G7DG0IWUQJgsacqsI_LRvZE8JTsbQIuQ=s900-c-k-c0x00ffffff-no-rj',
      });

      print('ユーザーを作成しました');
    } catch (e) {
      print('ユーザーの作成に失敗しました: $e');
    }
  }
}
