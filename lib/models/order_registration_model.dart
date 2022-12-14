class OrderRegistrationModel {
  int id;
  OrderRegistrationModel({
    required this.id,
  });
  factory OrderRegistrationModel.fromJson(Map<String, dynamic> json) {
    return OrderRegistrationModel(
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
