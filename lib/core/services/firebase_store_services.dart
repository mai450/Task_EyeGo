import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news/core/services/database_services.dart';

class FirestoreServices implements DataBaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? docId}) async {
    if (docId != null) {
      await firestore.collection(path).doc(docId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData(
      {required String path,
      String? docId,
      Map<String, dynamic>? query}) async {
    if (docId != null) {
      var data = await firestore.collection(path).doc(docId).get();

      return data.data();
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);

      // if (query != null) {
      //   if (query['orderBy'] != null) {
      //     var queryField = query['orderBy'];

      //     var descending = query['descending'];

      //     data = data.orderBy(queryField, descending: descending);
      //   }

      //   if (query['limit'] != null) {
      //     var limit = query['limit'];

      //     data.limit(limit);
      //   }
      // }

      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> checkIfUserExists(
      {required String path, required String docId}) async {
    var data = await firestore.collection(path).doc(docId).get();
    return data.exists;
  }
}
