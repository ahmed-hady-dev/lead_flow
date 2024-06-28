class RequiredCoursesModel {
  int? id;
  int? form;
  List<int?>? materials;

  RequiredCoursesModel({
    this.id,
    this.form,
    this.materials,
  });
  RequiredCoursesModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    form = json['form']?.toInt();
    if (json['materials'] != null) {
      final v = json['materials'];
      final arr0 = <int>[];
      v.forEach((v) {
        arr0.add(v.toInt());
      });
      materials = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['form'] = form;
    if (materials != null) {
      final v = materials;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v);
      }
      data['materials'] = arr0;
    }
    return data;
  }
}
