class LoginData {
  String email;
  String password;
  bool confirmed = false;

  LoginData({required this.email, required this.password});

  doSomething() {
    print("Email: $email");
    print("Senha: $password");
  }
}
