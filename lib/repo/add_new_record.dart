import 'package:practical3d/model/record_list_res.dart';
import 'package:practical3d/source/add_new_source.dart';

class AddNewRecordRepo {
  final addSource = AddNewRecordSource();

  Future<void> addNewRecord(
      {String? name,
      String? mathsMarks,
      String? scienceMarks,
      String? percentage,
      String? englishmarks}) async {
    return await addSource.addNewRecord(
      name: name,
      englishmarks: englishmarks,
      percentage: percentage,
      mathsMarks: mathsMarks,
      scienceMarks: scienceMarks,
    );
  }

  Stream<List<RecordListRes>> getStudentList() {
    return addSource.getUserRes();
  }

  Future<void> updateRecord(
      {String? name,
      String? mathsMarks,
      String? updateId,
      String? scienceMarks,
      String? percentage,
      String? englishmarks}) async {
    return await addSource.updateRecord(
      name: name,
      englishmarks: englishmarks,
      mathsMarks: mathsMarks,
      updateId: updateId,
      percentage:percentage,
      scienceMarks: scienceMarks,
    );
  }

  Future<void> deleteRecord({String? deleteId}) async {
    return await addSource.deleteRecord(delatedId: deleteId);
  }
}
