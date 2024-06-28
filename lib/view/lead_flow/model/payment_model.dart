class PaymentModel {
  String? message;
  int? paymentId;
  int? price;
  int? status;

  PaymentModel({
    this.message,
    this.paymentId,
    this.price,
    this.status,
  });
  PaymentModel.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString();
    paymentId = json['payment_id']?.toInt();
    price = json['price']?.toInt();
    status = json['status']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    data['payment_id'] = paymentId;
    data['price'] = price;
    data['status'] = status;
    return data;
  }
}
