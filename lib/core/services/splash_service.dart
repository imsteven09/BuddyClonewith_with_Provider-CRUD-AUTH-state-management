//import 'package:buddysigninwithui/core/services/login_service.dart';
import 'package:buddysigninwithui/core/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SigninandsignupService.islogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SigninandsignupService>(
        builder: (context, SigninandsignupServiceprovider, child) {
      return Scaffold(
        body: Center(
          child: Text('Welcome to buddy'),
        ),
      );
    });
  }
}
