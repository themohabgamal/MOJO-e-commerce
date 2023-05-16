import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              logOut();
            },
            child: Text("Log out")),
      ),
    );
  }

  Future logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
