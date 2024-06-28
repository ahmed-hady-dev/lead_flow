class AdditionalInfoModel {
  int? id;
  String? studentCount;
  int? form;
  List<int?>? purposes;

  AdditionalInfoModel({
    this.id,
    this.studentCount,
    this.form,
    this.purposes,
  });
  AdditionalInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    studentCount = json['student_count']?.toString();
    form = json['form']?.toInt();
    if (json['purposes'] != null) {
      final v = json['purposes'];
      final arr0 = <int>[];
      v.forEach((v) {
        arr0.add(v.toInt());
      });
      purposes = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['student_count'] = studentCount;
    data['form'] = form;
    if (purposes != null) {
      final v = purposes;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v);
      }
      data['purposes'] = arr0;
    }
    return data;
  }
}
