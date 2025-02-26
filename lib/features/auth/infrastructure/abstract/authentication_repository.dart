import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<User> signUpWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<bool> isSignedIn();
  User? getCurrentUser();
}
