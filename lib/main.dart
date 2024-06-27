import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:word_game/core/utils/size_utils.dart';
import 'package:word_game/features/auth/login/presentation/login.dart';
import 'package:word_game/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Sizer(
        builder: (context, orientation, deviceType) {
          return Scaffold(
            body: LoginPage(deviceType: deviceType),
          );
        },
      ),
    );
  }
}
