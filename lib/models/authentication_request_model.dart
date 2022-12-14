class AuthenticationRequestModel {
  String token;
  AuthenticationRequestModel({
    required this.token,
  });
  factory AuthenticationRequestModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationRequestModel(
      token: json['token'],
    );
  }
  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
