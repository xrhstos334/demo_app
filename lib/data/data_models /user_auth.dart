import 'package:firebase_auth/firebase_auth.dart';

class AuthUser {
  final String? displayName;
  final String  email;
  final String? photoURL;

  const AuthUser({
    this.displayName,
    required this.email,
    this.photoURL,
  });



  factory AuthUser.fromFirebase(User user) {
    return AuthUser(
      displayName: user.displayName,
      email: user.email ?? '',
      photoURL: user.photoURL,
    );
  }
}
