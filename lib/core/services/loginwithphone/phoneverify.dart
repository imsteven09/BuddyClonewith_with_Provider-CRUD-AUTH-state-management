import 'package:buddysigninwithui/core/constants/color_constant.dart';
import 'package:buddysigninwithui/core/constants/string_constant.dart';
import 'package:buddysigninwithui/core/constants/textstyle_constant.dart';
import 'package:buddysigninwithui/core/services/login_service.dart';
//import 'package:buddysigninwithui/ui/userdata.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneLoginVerify extends StatefulWidget {
  final String? verificationId;
  const PhoneLoginVerify({super.key, required this.verificationId});

  @override
  State<PhoneLoginVerify> createState() => _PhoneLoginVerifyState();
}

class _PhoneLoginVerifyState extends State<PhoneLoginVerify> {
  TextEditingController codeController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Consumer<SigninandsignupService>(
        builder: (context, SigninandsignupServiceprovider, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Verification Screen'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Please verify the code you rcieved on SMS'),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: codeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Enter 6 digit code',
                      hintStyle: AppTextStyle.textfield,
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: InkWell(
                    onTap: () async {
                      SigninandsignupServiceprovider.phoneverify(
                          context,
                          codeController.text.toString(),
                          widget.verificationId.toString());
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
                        AppString.verify,
                        style: AppTextStyle.signin,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
