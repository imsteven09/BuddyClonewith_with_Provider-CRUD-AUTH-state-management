//import 'package:buddysigninwithui/core/services/home.dart';
import 'package:buddysigninwithui/core/services/login_service.dart';
import 'package:buddysigninwithui/core/services/splash_service.dart';
import 'package:buddysigninwithui/core/services/userdata_service.dart';
//import 'package:buddysigninwithui/core/services/splash_service.dart';
import 'package:buddysigninwithui/firebase_options.dart';
//import 'package:buddysigninwithui/ui/userinfo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return SigninandsignupService();
        }),
        ChangeNotifierProvider(create: (context) {
          return UserDataService();
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
