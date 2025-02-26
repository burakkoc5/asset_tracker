import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class AuthenticationState {
  const AuthenticationState();
}

class AuthenticationStateUnauthenticated extends AuthenticationState {
  const AuthenticationStateUnauthenticated();
}

class AuthenticationStateAuthenticated extends AuthenticationState {
  final User user;

  const AuthenticationStateAuthenticated(this.user);
}

class AuthenticationStateLoading extends AuthenticationState {}

class AuthenticationStateError extends AuthenticationState {
  final String errorMessage;

  const AuthenticationStateError(this.errorMessage);
}
