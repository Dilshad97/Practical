import 'package:practical3d/base/base_ui_state.dart';
import 'package:practical3d/model/record_list_res.dart';

class RecordListState extends BaseUiState<List<RecordListRes>> {
  RecordListState.loading() : super.loading();

  RecordListState.completed(List<RecordListRes> data) : super.completed(data: data);

  RecordListState.error(dynamic error) : super.error(error);
}
