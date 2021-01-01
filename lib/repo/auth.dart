import 'package:proj_final_mobile/models/user.dart';

abstract class AuthRepo {
  Future<UserModel> signInWithEmailAndPassword({String email, String password});

  Future<void> signOut();

  Future<UserModel> createUserWithEmailAndPassword(
      {String email, String password});

  Stream<UserModel> get user;
}
