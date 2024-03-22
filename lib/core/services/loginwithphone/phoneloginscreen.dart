import 'package:buddysigninwithui/core/constants/color_constant.dart';
import 'package:buddysigninwithui/core/constants/string_constant.dart';
import 'package:buddysigninwithui/core/constants/textstyle_constant.dart';
import 'package:buddysigninwithui/core/services/login_service.dart';
// import 'package:buddysigninwithui/core/services/loginwithphone/phoneverify.dart';
import 'package:buddysigninwithui/core/services/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({super.key});

  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  final _formKEY = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Consumer<SigninandsignupService>(
        builder: (context, SigninandsignupServiceprovider, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Phone Login'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Text(
                      AppString.helloagain,
                      style: AppTextStyle.helloagain,
                    ),
                    Text(AppString.signintoyouraccnt)
                  ],
                ),
              ),
              Form(
                  key: _formKEY,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("enter phone no"),
                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            hintText: '+91 8439766282',
                            hintStyle: AppTextStyle.textfield,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            SigninandsignupServiceprovider.loginwithphone(
                                phoneController.text, context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 58,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  AppColors.signinbuttonprimary,
                                  AppColors.signinbuttonsecondary
                                ]),
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              AppString.signin,
                              style: AppTextStyle.signin,
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppString.donthaveaccnt,
                    style: AppTextStyle.donthaveaccnt,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignupPage();
                        }));
                      },
                      child: const Text(
                        AppString.signup,
                        style: AppTextStyle.signuppage,
                      ))
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
