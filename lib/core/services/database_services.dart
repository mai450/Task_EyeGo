abstract class DataBaseServices {
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? docId});

  Future<dynamic> getData(
      {required String path, String? docId, Map<String, dynamic>? query});

  Future<bool> checkIfUserExists({required String path, required String docId});
}
