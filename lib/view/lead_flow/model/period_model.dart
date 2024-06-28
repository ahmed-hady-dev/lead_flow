class PeriodModel {
  int? id;
  String? shift;
  String? time;
  int? form;
  List<int?>? day;

  PeriodModel({
    this.id,
    this.shift,
    this.time,
    this.form,
    this.day,
  });
  PeriodModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    shift = json['shift']?.toString();
    time = json['time']?.toString();
    form = json['form']?.toInt();
    if (json['day'] != null) {
      final v = json['day'];
      final arr0 = <int>[];
      v.forEach((v) {
        arr0.add(v.toInt());
      });
      day = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['shift'] = shift;
    data['time'] = time;
    data['form'] = form;
    if (day != null) {
      final v = day;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v);
      }
      data['day'] = arr0;
    }
    return data;
  }
}
