
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../routes/routes.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: TextButton(
            onPressed: () async {
              try {
                await FacebookAuth.instance.logOut();
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.loginScreen, (route) => false);
              } catch (e) {
                print('❌ Logout failed: $e');
              }
            },
            child: Text(
              'logout',
            ),
          ),
        ),

      ]);
  }
}
