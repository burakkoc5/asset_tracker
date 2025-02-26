import 'package:asset_tracker/features/auth/infrastructure/abstract/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepositoryImpl extends AuthenticationRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _firebaseAuth.currentUser!;
  }

  @override
  Future<User> signUpWithEmailAndPassword(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    return _firebaseAuth.currentUser!;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<bool> isSignedIn() {
    return Future.value(_firebaseAuth.currentUser != null);
  }

  @override
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}
