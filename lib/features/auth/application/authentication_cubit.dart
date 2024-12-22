import 'package:asset_tracker/features/auth/application/authentication_state.dart';
import 'package:asset_tracker/core/errors/firebase_auth_exception_extension.dart';
import 'package:asset_tracker/features/auth/infrastructure/abstract/authentication_repository.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(this._AuthenticationRepository)
      : super(const AuthenticationStateUnauthenticated());

  final AuthenticationRepository _AuthenticationRepository;

  Future<void> signin(String email, String password) async {
    emit(const AuthenticationStateLoading());
    try {
      await _AuthenticationRepository.signInWithEmailAndPassword(
          email, password);
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
      await _AuthenticationRepository.signUpWithEmailAndPassword(
          email, password);
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
      await _AuthenticationRepository.signOut();
      emit(const AuthenticationStateUnauthenticated());
    } on FirebaseAuthException catch (e) {
      emit(AuthenticationStateError(e.getErrorMessage()));
    } catch (e) {
      emit(AuthenticationStateError(t.core.errors.unknown));
    }
  }
}
