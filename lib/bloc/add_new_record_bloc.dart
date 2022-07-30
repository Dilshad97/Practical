import 'package:practical3d/base/base_bloc.dart';
import 'package:practical3d/state/record_list_state.dart';
import 'package:rxdart/rxdart.dart';

import '../repo/add_new_record.dart';

class AddNewRecordsBloc extends BaseBloc {
  final addNewRepo = AddNewRecordRepo();
  final studentState = BehaviorSubject<RecordListState>();
  final percentage = BehaviorSubject<double>();

  Future<void> addNewRecord(
      {String? name,
      String? mathsMarks,
      String? percentage,
      String? scienceMarks,
      String? englishMarks}) async {
    return await addNewRepo.addNewRecord(
        name: name,
        englishmarks: englishMarks,
        percentage: percentage,
        mathsMarks: mathsMarks,
        scienceMarks: scienceMarks);
  }

  void getStudentsList() {
    studentState.add(RecordListState.loading());

    subscription.add(addNewRepo
        .getStudentList()
        .map((event) => RecordListState.completed(event))
        .onErrorReturnWith((error, stackTrace) => RecordListState.error(error))
        .startWith(RecordListState.loading())
        .listen((event) {
      studentState.add(event);
    }));
  }

  Future<void> updateRecord(
      {String? name,
      String? mathsMarks,
      String? updateId,
      String? scienceMarks,
      String? percentage,
      String? englishMarks}) async {
    return await addNewRepo.updateRecord(
        name: name,
        englishmarks: englishMarks,
        mathsMarks: mathsMarks,
        percentage: percentage,
        updateId: updateId,
        scienceMarks: scienceMarks);
  }

  Future<void> deleteRecord({String? deleteId}) async {
    return await addNewRepo.deleteRecord(deleteId: deleteId);
  }




}
