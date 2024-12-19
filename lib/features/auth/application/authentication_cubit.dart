import 'package:asset_tracker/features/auth/application/authentication_state.dart';
import 'package:asset_tracker/core/errors/authentication_errors.dart';
import 'package:asset_tracker/features/auth/infrastructure/abstract/authentication_service.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(this._authenticationService)
      : super(const AuthenticationStateUnauthenticated());

  final AuthenticationService _authenticationService;

  Future<void> signin(String email, String password) async {
    emit(const AuthenticationStateLoading());
    try {
      await _authenticationService.signInWithEmailAndPassword(email, password);
      emit(const AuthenticationStateAuthenticated());
    } on FirebaseAuthException catch (e) {
      emit(AuthenticationStateError(
          AuthenticationErrors.getErrorMessage(e.code)));
    } catch (e) {
      emit(AuthenticationStateError(
          AuthenticationErrors.unexpectedErrorMessage));
    }
  }

  Future<void> signup(String email, String password) async {
    emit(const AuthenticationStateLoading());
    try {
      await _authenticationService.signUpWithEmailAndPassword(email, password);
      emit(const AuthenticationStateAuthenticated());
    } on FirebaseAuthException catch (e) {
      emit(AuthenticationStateError(
          AuthenticationErrors.getErrorMessage(e.code)));
    } catch (e) {
      emit(AuthenticationStateError(
          AuthenticationErrors.unexpectedErrorMessage));
    }
  }

  Future<void> signout() async {
    emit(const AuthenticationStateLoading());
    try {
      await _authenticationService.signOut();
      emit(const AuthenticationStateUnauthenticated());
    } on FirebaseAuthException catch (e) {
      emit(AuthenticationStateError(
          AuthenticationErrors.getErrorMessage(e.code)));
    } catch (e) {
      emit(AuthenticationStateError(
          AuthenticationErrors.unexpectedErrorMessage));
    }
  }
}
