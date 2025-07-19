

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/data/data_models%20/user_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../utils/logger.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// Sign in with email and password
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      return null;
    }
  }

  Future<bool> signUpWithEmailUsernameAndPassword({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = userCredential.user;

      if (user == null) {
        Log.e("User is null after sign-up");
        return false;
      }
      await user.updateDisplayName(username);
      await user.reload();
      final updatedUser = _firebaseAuth.currentUser;
      Log.i("Username: ${updatedUser?.displayName}");

      // Αποθήκευση στο Firestore
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'email': email,
        'name': username,
        'createdAt': FieldValue.serverTimestamp(),
        'profileImage': null,
      });

      return true;
    } on FirebaseAuthException catch (e) {
      Log.e('Sign-up error: ${e.message}');
      return false;
    } catch (e) {
      Log.e('Unexpected error: $e');
      return false;
    }
  }


  // Facebook Sign-In logic
  Future<UserCredential?> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login(
      loginBehavior: LoginBehavior.webOnly,
    );

    if (result.status == LoginStatus.success) {
      final OAuthCredential credential = FacebookAuthProvider.credential(
        result.accessToken!.tokenString,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }

    return null;
  }

  Future<void> sendPasswordReset(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Log.i("Reset email sent to $email");
    } on FirebaseAuthException catch (e) {
      Log.e("Error sending reset email: ${e.message}");
      throw e;
    }
  }

  AuthUser? getUserInfo() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String? displayName = user.displayName;
      String? photoURL = user.photoURL;
      String? email = user.email;
      Log.i('Όνομα: $displayName');
      Log.i('Φωτογραφία: $photoURL');
      Log.i('Email: $email');
      return AuthUser.fromFirebase(user);
    } else {
      Log.i('Κανένας χρήστης δεν είναι συνδεδεμένος.');
      return null;
    }
  }


  /// Sign out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  /// Get current user
  User? get currentUser => _firebaseAuth.currentUser;

  /// Check if a user is logged in
  bool get isLoggedIn => currentUser != null;

  /// Listen to auth state changes
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
}
