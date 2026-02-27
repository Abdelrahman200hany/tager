abstract class DataBaseServies {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentID,
  });

  Future<Map<String, dynamic>> readData({
    required String documentID,
    required String path,
  });
  Future<bool> chekedDataIfExits({required String path, required String deumentID});
}
