class RecordListRes {
  String? name;
  String? maths;
  String? science;
  String? english;
  String? updateId;
  String? percentage;

  RecordListRes({
    this.name,
    this.maths,
    this.science,
    this.english,
  });

  RecordListRes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    maths = json['maths'];
    english = json['english'];
    science = json["science"];
    updateId = json["updateId"];
    percentage = json["percentage"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['maths'] = maths;
    data['science'] = science;
    data['english'] = english;
    data['updateId'] = updateId;
    data['percentage'] = percentage;
    return data;
  }
}
