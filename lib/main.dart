import 'package:e_commerce_fruits_app/firebase_options.dart';
import 'package:e_commerce_fruits_app/views/splash_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, home: SplashScreen(),
      // AuthenticationWrapper(),
    );
  }
}

// class AuthenticationWrapper extends StatelessWidget {
//   const AuthenticationWrapper({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AuthProvider>(builder: (context, authProvider, child) {
//       if (authProvider.isSignedIn) {
//         return SplashScreen();
//       } else {
//         return WelcomeScreen();
//       }
//     });
//   }
// }
