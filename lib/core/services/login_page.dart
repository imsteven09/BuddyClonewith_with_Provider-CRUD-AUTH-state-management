import 'package:buddysigninwithui/core/constants/color_constant.dart';
import 'package:buddysigninwithui/core/constants/string_constant.dart';
import 'package:buddysigninwithui/core/constants/textstyle_constant.dart';
import 'package:buddysigninwithui/core/services/login_service.dart';
import 'package:buddysigninwithui/core/services/loginwithphone/phoneloginscreen.dart';
import 'package:buddysigninwithui/core/services/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  final _formKEY = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<SigninandsignupService>(
        builder: (context, SigninandsignupServiceprovider, child) {
      return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: 50),
                Container(
                  child: const Column(
                    children: [
                      Text(
                        AppString.helloagain,
                        style: AppTextStyle.helloagain,
                      ),
                      Text(
                        AppString.signintoyouraccnt,
                        style: AppTextStyle.signintoyouraccnt,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                    key: _formKEY,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        Container(
                          height: 15,
                          alignment: Alignment.centerRight,
                          child: const Text(
                            AppString.frgtpaswrd,
                            style: AppTextStyle.frgtpaswrd,
                          ),
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
                                SigninandsignupServiceprovider.signinservice(
                                    context,
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
                                AppString.signin,
                                style: AppTextStyle.signin,
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PhoneLoginScreen();
                    }));
                  },
                  child: Text('Login with phone Number'),
                ),
                SizedBox(
                  height: 30,
                ),
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
                          border:
                              Border.all(width: 2, color: AppColors.darkblue)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // Image.asset('assets/images/facebook.png'),

                        children: [
                          Image.asset(
                            'assets/images/facebooklogo.png',
                            height: 40,
                          ),
                          const Text(
                            '${AppString.signinwith} Facebook ',
                            style: AppTextStyle.signinwithfacebook,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        SigninandsignupServiceprovider.googlesignin(context);
                      },
                      child: Container(
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
                              '${AppString.signinwith} Google',
                              style: AppTextStyle.signinwithgoogle,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
                SizedBox(
                  height: 30,
                ),
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
              ]),
            ),
          ));
    });
  }
}
