import 'package:proj_final_mobile/models/user.dart';

abstract class AuthEvent {}

class RegisterUser extends AuthEvent {
  String username;
  String password;
  String nome;
  String email;
}

class LoginUser extends AuthEvent {
  String email;
  String password;
}

class LogOut extends AuthEvent {}

class FirebaseEvent extends AuthEvent {
  final UserModel userModel;

  FirebaseEvent(this.userModel);
}
