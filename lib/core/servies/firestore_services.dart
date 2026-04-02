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
  Future<dynamic> readData({
    String? documentID,
    required String path,
    Map<String, dynamic>? query,
  }) async {
    if (documentID != null) {
      var data = await firestore.collection(path).doc(documentID).get();
      return data.data() as Map<String, dynamic>;
    } else {
      CollectionReference<Map<String, dynamic>> data = firestore.collection(
        path,
      );

      if (query != null) {
        if (query['orderBy'] != null) {
          var orderByFeild = query['orderBy'];
          bool descending = query['descending'];
          data.orderBy(orderByFeild, descending: descending);
        }
        if (query['limit'] != null) {
          int limit = query['limit'];
          data.limit(limit);
        }
        var result = await data.get();
        return result.docs.map((e) => e.data()).toList();
      }
    }
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
