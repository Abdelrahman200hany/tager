
import 'package:tager/core/servies/data_base_servies.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServices implements DataBaseServies {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentID,
  }) async {
    if (documentID == null) {
      await firestore.collection(path).add(data);
    } else {
      await firestore.collection(path).doc(documentID).set(data);
    }
  }

  @override
  Future<Map<String, dynamic>> readData({
    required String documentID,
    required String path,
  }) async {
    var data = await firestore.collection(path).doc(documentID).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> chekedDataIfExits({
    required String path,
    required String deumentID,
  }) async {
    var userIsExits = await firestore.collection(path).doc(deumentID).get();

    return userIsExits.exists;
  }
}
