import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:practical3d/model/record_list_res.dart';

class AddNewRecordSource {
  Future<void> addNewRecord(
      {String? name,
      String? mathsMarks,
      String? scienceMarks,
      String? updateId,
      String? percentage,
      String? englishmarks}) async {
    try {
      await FirebaseFirestore.instance.collection("students").doc(name).set({
        "name": name,
        "updateId": name,
        "maths": mathsMarks,
        "percentage": percentage,
        "science": scienceMarks,
        "english": englishmarks,
      }).then((value) {
        print(
            "=================== new record inserted to database ================");
      });
    } catch (e) {}
  }

  Future<void> updateRecord(
      {String? name,
      String? mathsMarks,
      String? updateId,
      String? percentage,
      String? scienceMarks,
      String? englishmarks}) async {
    try {
      await FirebaseFirestore.instance
          .collection("students")
          .doc(updateId)
          .update({
        "name": name,
        "maths": mathsMarks,
        "science": scienceMarks,
        "percentage": percentage,
        "english": englishmarks,
      }).then((value) {
        print(
            "=================== new record Updated to database ================");
      });
    } catch (e) {}
  }

  Future<void> deleteRecord({String? delatedId}) async {
    try {
      await FirebaseFirestore.instance
          .collection("students")
          .doc(delatedId)
          .delete()
          .then((value) {
        print(
            "=================== new record Deleted to database ================");
      });
    } catch (e) {}
  }

  Stream<List<RecordListRes>> getUserRes() {
    return FirebaseFirestore.instance.collection("students").snapshots().map(
        (event) =>
            event.docs.map((e) => RecordListRes.fromJson(e.data())).toList());
  }
}
