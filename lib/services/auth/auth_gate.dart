import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../views/Home/home_screen.dart';
import '../../views/splash_Screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                  child: Text("Something went wrong.Please ry again."));
            }

            if (snapshot.hasData) {
              return const HomeScreen();
            } else {
              return const SplashScreen();
            }
          }),
    );
  }
}
