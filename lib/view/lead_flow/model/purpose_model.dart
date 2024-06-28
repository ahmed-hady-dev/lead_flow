class PurposeModel {
  int? id;
  String? englishData;
  String? arabicData;
  String? forData;

  PurposeModel({
    this.id,
    this.englishData,
    this.arabicData,
    this.forData,
  });
  PurposeModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    englishData = json['english_data']?.toString();
    arabicData = json['arabic_data']?.toString();
    forData = json['for_data']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['english_data'] = englishData;
    data['arabic_data'] = arabicData;
    data['for_data'] = forData;
    return data;
  }
}
