import '../model/user_model.dart';

abstract class AuthEvent {}

class RegisterUser extends AuthEvent {
  String nome;
  String email;
  String password;
  String idade;
  String pais;
  String nivel;

  RegisterUser({
    required this.nome,
    required this.email,
    required this.password,
    required this.idade,
    required this.pais,
    required this.nivel,
  });
}

class LoginUser extends AuthEvent {
  String email;
  String password;

  LoginUser({required this.email, required this.password});
}

class LoginAnonymousUser extends AuthEvent {}

class Logout extends AuthEvent {}

class AuthServerEvent extends AuthEvent {
  final UserModel? userModel;
  AuthServerEvent(this.userModel);
}
