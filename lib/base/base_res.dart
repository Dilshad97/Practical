class BaseResponse<T> {
  String? status;
  String? message;
  T? data;

  void fromJSON(Map<String, dynamic> map) {
    status = map['status'];
    message = map['message'];
    data = map['data'];
  }
}