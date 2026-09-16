import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:talabat/firebase_options.dart';
import 'package:talabat/screens/app_navigation_bar.dart';
import 'package:talabat/screens/login_screen.dart';

void main () async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title : "talabat",
      home : AppNavigationBar(),
    );
  }
}