class KioskModel {
  int id;
  KioskModel({
    required this.id,
  });
  factory KioskModel.fromJson(Map<String, dynamic> json) => KioskModel(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
