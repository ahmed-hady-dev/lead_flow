class SubscriptionModel {
  int? id;
  String? term;
  String? termArabic;
  String? discount;
  String? period;
  String? periodArabic;
  String? price;
  String? forData;

  SubscriptionModel({
    this.id,
    this.term,
    this.termArabic,
    this.discount,
    this.period,
    this.periodArabic,
    this.price,
    this.forData,
  });
  SubscriptionModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    term = json['term']?.toString();
    termArabic = json['term_arabic']?.toString();
    discount = json['discount']?.toString();
    period = json['period']?.toString();
    periodArabic = json['period_arabic']?.toString();
    price = json['price']?.toString();
    forData = json['for_data']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['term'] = term;
    data['term_arabic'] = termArabic;
    data['discount'] = discount;
    data['period'] = period;
    data['period_arabic'] = periodArabic;
    data['price'] = price;
    data['for_data'] = forData;
    return data;
  }
}
