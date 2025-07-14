import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../routes/routes.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () async{
            try {
              await FacebookAuth.instance.logOut(); // Πρώτα το Facebook
              await FirebaseAuth.instance.signOut(); // Μετά το Firebase

              Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (route) => false);
            } catch (e) {
              print('❌ Logout failed: $e');
            }
          },
          child: Text(
            'logout',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for the button
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
