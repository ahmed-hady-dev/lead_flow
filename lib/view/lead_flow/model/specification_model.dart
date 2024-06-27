class SpecificationModel {
  int? id;
  List<String?>? stage;
  List<String?>? classroom;
  List<String?>? courseStudy;
  int? form;

  SpecificationModel({
    this.id,
    this.stage,
    this.classroom,
    this.courseStudy,
    this.form,
  });
  SpecificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    if (json['stage'] != null) {
      final v = json['stage'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      stage = arr0;
    }
    if (json['classroom'] != null) {
      final v = json['classroom'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      classroom = arr0;
    }
    if (json['course_study'] != null) {
      final v = json['course_study'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      courseStudy = arr0;
    }
    form = json['form']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (stage != null) {
      final v = stage;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v);
      }
      data['stage'] = arr0;
    }
    if (classroom != null) {
      final v = classroom;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v);
      }
      data['classroom'] = arr0;
    }
    if (courseStudy != null) {
      final v = courseStudy;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v);
      }
      data['course_study'] = arr0;
    }
    data['form'] = form;
    return data;
  }
}
