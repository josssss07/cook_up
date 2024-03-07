import 'package:cook_up/pages/profilepage.dart';
import 'package:cook_up/pages/recipe_browser.dart';
import 'package:cook_up/pages/search_page.dart';
import 'package:cook_up/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'utils/app_bar.dart';
// import 'package:hungry/views/screens/auth/welcome_page.dart';

void main() async {
  
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.light,
  ));

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Open Sans',
        scaffoldBackgroundColor: AppColor.primarySoft,
      ),
      home: ProfilePage(), //until navbar is completedw
    );
  }
}
