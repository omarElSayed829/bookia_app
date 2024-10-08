class SignUpModelParams {
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;

  SignUpModelParams(
      {required this.name,
      required this.email,
      required this.password,
      required this.passwordConfirmation});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation
    };
  }
}
