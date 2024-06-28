class ClassModel {
  int? id;
  String? session;
  String? hour;
  int? form;
  int? subscription;

  ClassModel({
    this.id,
    this.session,
    this.hour,
    this.form,
    this.subscription,
  });
  ClassModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    session = json['session']?.toString();
    hour = json['hour']?.toString();
    form = json['form']?.toInt();
    subscription = json['subscription']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['session'] = session;
    data['hour'] = hour;
    data['form'] = form;
    data['subscription'] = subscription;
    return data;
  }
}
