class PaymentRequestModel {
  String token;
  PaymentRequestModel({
    required this.token,
  });

  factory PaymentRequestModel.fromJson(Map<String, dynamic> json) {
    return PaymentRequestModel(
      token: json['token'],
    );
  }
  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
