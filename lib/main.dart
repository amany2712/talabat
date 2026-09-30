import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talabat/constants/app_colors.dart';
import 'package:talabat/controller/provider_controller.dart';
import 'package:talabat/firebase_options.dart';
import 'package:talabat/screens/app_navigation_bar.dart';
import 'package:talabat/screens/login_screen.dart';

void main () async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ProviderController()..getTheme(),
      )

    ],
    child: MyApp())
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final providerController = Provider.of<ProviderController>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title : "talabat",
      theme:providerController.isDark ? AppColors.darkTheme : AppColors.lightTheme ,
      home : LoginScreen(),
    );
  }
}