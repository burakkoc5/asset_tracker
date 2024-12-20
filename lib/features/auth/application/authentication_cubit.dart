import 'package:asset_tracker/features/auth/application/authentication_state.dart';
import 'package:asset_tracker/core/errors/firebase_auth_exception_extension.dart';
import 'package:asset_tracker/features/auth/infrastructure/abstract/authentication_service.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
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
      emit(AuthenticationStateError(e.getErrorMessage()));
    } catch (e) {
      emit(AuthenticationStateError(t.core.errors.unknown));
    }
  }

  Future<void> signup(String email, String password) async {
    emit(const AuthenticationStateLoading());
    try {
      await _authenticationService.signUpWithEmailAndPassword(email, password);
      emit(const AuthenticationStateAuthenticated());
    } on FirebaseAuthException catch (e) {
      emit(AuthenticationStateError(e.getErrorMessage()));
    } catch (e) {
      emit(AuthenticationStateError(t.core.errors.unknown));
    }
  }

  Future<void> signout() async {
    emit(const AuthenticationStateLoading());
    try {
      await _authenticationService.signOut();
      emit(const AuthenticationStateUnauthenticated());
    } on FirebaseAuthException catch (e) {
      emit(AuthenticationStateError(e.getErrorMessage()));
    } catch (e) {
      emit(AuthenticationStateError(t.core.errors.unknown));
    }
  }
}
