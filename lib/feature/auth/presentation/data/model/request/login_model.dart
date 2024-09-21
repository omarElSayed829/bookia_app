class LoginModelParams {
  String? email;
  String? password;

  LoginModelParams({required this.email, required this.password}) {}

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}
