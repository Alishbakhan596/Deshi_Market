import 'package:e_commerce_fruits_app/firebase_options.dart';
import 'package:e_commerce_fruits_app/services/Provider/favourite_provider.dart';
import 'package:e_commerce_fruits_app/services/Provider/provider_state.dart';
import 'package:e_commerce_fruits_app/services/auth/auth_service.dart';
import 'package:e_commerce_fruits_app/views/splash_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Stripe.publishableKey = publishKey;
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    print(e);
    if (kDebugMode) {
      print("Error initializing Firebase: $e");
    }
    return;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavouriteItem()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false, home: SplashScreen()),
    );
  }
}
