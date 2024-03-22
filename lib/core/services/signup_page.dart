import 'package:buddysigninwithui/core/constants/color_constant.dart';
import 'package:buddysigninwithui/core/constants/string_constant.dart';
import 'package:buddysigninwithui/core/constants/textstyle_constant.dart';
import 'package:buddysigninwithui/core/services/login_page.dart';
import 'package:buddysigninwithui/core/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController usernameController = TextEditingController();

  final _formKEY = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<SigninandsignupService>(
        builder: (context, SigninandsignupServiceprovider, child) {
      return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: const Column(
                      children: [
                        Text(
                          AppString.helloagain,
                          style: AppTextStyle.helloagain,
                        ),
                        // Text(
                        //   AppString.signuptoyouraccnt,
                        //   style: AppTextStyle.signintoyouraccnt,
                        // ),
                        Text(AppString.signuptoaccnt)
                      ],
                    ),
                  ),
                  Form(
                      key: _formKEY,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('User Name'),
                          TextFormField(
                            controller: usernameController,
                            decoration: InputDecoration(
                                hintText: 'profile@gmail.com',
                                hintStyle: AppTextStyle.textfield,
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.textfield),
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          const Text(
                            AppString.emailaddress,
                            style: AppTextStyle.emailaddress,
                          ),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                                hintText: 'profile@gmail.com',
                                hintStyle: AppTextStyle.textfield,
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.textfield),
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            AppString.password,
                            style: AppTextStyle.password,
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                                hintText: 'Enter the Password',
                                hintStyle: AppTextStyle.textfield,
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.textfield),
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            child: InkWell(
                              onTap: () {
                                if (_formKEY.currentState!.validate()) {
                                  SigninandsignupServiceprovider.signupservice(
                                      context,
                                      usernameController.text.toString(),
                                      emailController.text.toString(),
                                      passwordController.text.toString());
                                }
                              },
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
                                  AppString.signup,
                                  style: AppTextStyle.signin,
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                  Container(
                    height: 20,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppString.orwith,
                          style: AppTextStyle.orwith,
                        ),
                      ],
                    ),
                  ),
                  Container(
                      child: Column(
                    children: [
                      Container(
                        height: 58,
                        width: 311,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                                width: 2, color: AppColors.darkblue)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // Image.asset('assets/images/facebook.png'),

                          children: [
                            Image.asset(
                              'assets/images/facebooklogo.png',
                              height: 40,
                            ),
                            const Text(
                              '${AppString.signupwith} Facebook ',
                              style: AppTextStyle.signinwithfacebook,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 58,
                        width: 311,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                                width: 2, color: AppColors.darkblue)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/googlelogo.png',
                              height: 40,
                            ),
                            const Text(
                              '${AppString.signupwith} Google',
                              style: AppTextStyle.signinwithgoogle,
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        AppString.alrdyhaveaccnt,
                        style: AppTextStyle.donthaveaccnt,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return LoginPage();
                            }));
                          },
                          child: const Text(
                            AppString.signin,
                            style: AppTextStyle.signuppage,
                          ))
                    ],
                  )
                ]),
          ));
    });
  }
}
