import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:proj_final_mobile/bloc/auth_event.dart';
import 'package:proj_final_mobile/bloc/auth_state.dart';
import 'package:proj_final_mobile/firebase/auth.dart';
import 'package:proj_final_mobile/models/user.dart';
import 'package:proj_final_mobile/repo/auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepo _authenticationService;
  StreamSubscription _authenticationStream;

  AuthBloc() : super(Unauthenticated()) {
    _authenticationService = FirebaseAuthenticationService();

    _authenticationStream =
        _authenticationService.user.listen((UserModel event) {
      add(FirebaseEvent(event));
    });
  }

  @override
  Stream<AuthState> mapEventToState(event) async* {
    try {
      if (event == null) {
        yield Unauthenticated();
      } else if (event is RegisterUser) {
        UserModel userModel =
            await _authenticationService.createUserWithEmailAndPassword(
                email: event.email, password: event.password);
        //yield Authenticated(userModel); já está sendo recebido pelo retorno geral direto do firebase
      } else if (event is LoginUser) {
        UserModel userModel =
            await _authenticationService.signInWithEmailAndPassword(
                email: event.email, password: event.password);
        //yield Authenticated(userModel); já está sendo recebido pelo retorno geral direto do firebase
      } else if (event is LogOut) {
        await _authenticationService.signOut();
      } else if (event is FirebaseEvent) {
        if (event.userModel == null) {
          yield Unauthenticated();
        } else {
          yield Authenticated(event.userModel);
        }
      }
    } catch (e) {
      yield AuthError(e.toString());
    }
  }

  @override
  Future<void> close() {
    _authenticationStream.cancel();
    return super.close();
  }
}
