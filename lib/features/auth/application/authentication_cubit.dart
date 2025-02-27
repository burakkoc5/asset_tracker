import 'package:asset_tracker/features/auth/application/authentication_state.dart';
import 'package:asset_tracker/core/errors/firebase_auth_exception_extension.dart';
import 'package:asset_tracker/features/auth/infrastructure/abstract/authentication_repository.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(this._authenticationRepository)
      : super(const AuthenticationStateUnauthenticated()) {
    _checkUserStatus();
  }

  final AuthenticationRepository _authenticationRepository;

  // This will check if the user is already authenticated on app start.
  Future<void> _checkUserStatus() async {
    final isSignedIn = await _authenticationRepository.isSignedIn();
    if (isSignedIn) {
      final user = _authenticationRepository.getCurrentUser();
      print('User is already signed in: ${user!.uid}');
      emit(AuthenticationStateAuthenticated(user));
    }
  }

  Future<void> signin(String email, String password) async {
    emit(AuthenticationStateLoading());
    try {
      User user = await _authenticationRepository.signInWithEmailAndPassword(
          email, password);
      emit(AuthenticationStateAuthenticated(user));
      print('User signed in: ${user.email} and authenticated: ${user.uid}');
    } on FirebaseAuthException catch (e) {
      emit(AuthenticationStateError(e.getErrorMessage()));
    } catch (e) {
      emit(AuthenticationStateError(t.core.errors.unknown));
    }
  }

  Future<void> signup(String email, String password) async {
    emit(AuthenticationStateLoading());
    try {
      User user = await _authenticationRepository.signUpWithEmailAndPassword(
          email, password);
      emit(AuthenticationStateAuthenticated(user));
    } on FirebaseAuthException catch (e) {
      emit(AuthenticationStateError(e.getErrorMessage()));
    } catch (e) {
      emit(AuthenticationStateError(t.core.errors.unknown));
    }
  }

  Future<void> signout() async {
    emit(AuthenticationStateLoading());
    try {
      await _authenticationRepository.signOut();
      emit(const AuthenticationStateUnauthenticated());
    } on FirebaseAuthException catch (e) {
      emit(AuthenticationStateError(e.getErrorMessage()));
    } catch (e) {
      emit(AuthenticationStateError(t.core.errors.unknown));
    }
  }
}
