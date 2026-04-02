abstract class DataBaseServies {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentID,
  });

  Future<dynamic> readData({
    String? documentID,
    required String path,
    Map<String, dynamic>? query,
  });
  Future<bool> chekedDataIfExits({
    required String path,
    required String deumentID,
  });
}
