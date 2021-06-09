class RegisterForm {
  String name;
  String email;
  String password;
  String repeatPass;

  RegisterForm({
    required this.name,
    required this.email,
    required this.password,
    required this.repeatPass,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'repeatPass': repeatPass
    };
  }
}
