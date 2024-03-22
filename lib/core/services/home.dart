import 'package:buddysigninwithui/core/constants/color_constant.dart';
import 'package:buddysigninwithui/core/constants/string_constant.dart';
import 'package:buddysigninwithui/core/constants/textstyle_constant.dart';
import 'package:buddysigninwithui/core/services/login_page.dart';
import 'package:buddysigninwithui/core/services/login_service.dart';
import 'package:buddysigninwithui/core/services/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SigninandsignupService>(
        builder: (context, SigninandsignupServiceprovider, child) {
      return Scaffold(
        body: Column(children: [
          Stack(
            children: [
              Image.asset('assets/images/buddybackground.png'),
              Positioned(
                  bottom: -10,
                  left: -28,
                  child: Image.asset(
                    'assets/images/buddylogo.png',
                    scale: 1.3,
                  ))
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            AppString.whteverurhobby,
            style: AppTextStyle.whteverurhobbyfindbuddy,
          ),
          Text(
            AppString.findbuddy,
            style: AppTextStyle.whteverurhobbyfindbuddy,
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SignupPage();
            })),
            child: Container(
              alignment: Alignment.center,
              height: 58,
              width: 311,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    AppColors.signinbuttonprimary,
                    AppColors.signinbuttonsecondary
                  ]),
                  borderRadius: BorderRadius.circular(30)),
              child: const Text(
                AppString.crtacnt,
                style: AppTextStyle.createacnt,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LoginPage();
            })),
            child: Text(
              AppString.signin,
              style: AppTextStyle.signinhome,
            ),
          )
        ]),
      );
    });
  }
}
