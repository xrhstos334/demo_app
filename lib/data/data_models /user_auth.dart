import 'package:firebase_auth/firebase_auth.dart';

class AuthUser {
  final String? displayName;
  final String  email;
  final String? photoURL;
  final String? uid;

  const AuthUser({
    this.displayName,
    required this.email,
    this.photoURL,
    required this.uid,
  });



  factory AuthUser.fromFirebase(User user) {
    return AuthUser(
      displayName: user.displayName,
      email: user.email ?? '',
      photoURL: user.photoURL,
      uid: user.uid,
    );
  }
}
