abstract class AuthenticationState {
  const AuthenticationState();
}

class AuthenticationStateUnauthenticated extends AuthenticationState {
  const AuthenticationStateUnauthenticated();
}

class AuthenticationStateAuthenticated extends AuthenticationState {
  const AuthenticationStateAuthenticated();
}

class AuthenticationStateLoading extends AuthenticationState {
  const AuthenticationStateLoading();
}

class AuthenticationStateError extends AuthenticationState {
  final String errorMessage;

  const AuthenticationStateError(this.errorMessage);
}
