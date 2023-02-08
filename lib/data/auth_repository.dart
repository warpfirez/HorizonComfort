import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthRepository {
  final auth.FirebaseAuth _firebaseAuth;

  AuthRepository({auth.FirebaseAuth? firebaseAuth})
      // pass firebaseAuth in case its null create new instance
      : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  Future<auth.User?> register({
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credential.user;
      return user;
    } catch (e) {
      print(e);
      throw NetworkException();
    }
  }

  // stream informing whether something changed in the user object
  Stream<auth.User?> get user => _firebaseAuth.userChanges();
}

class NetworkException implements Exception {}
