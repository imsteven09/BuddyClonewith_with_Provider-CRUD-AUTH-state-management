import 'package:buddysigninwithui/core/constants/color_constant.dart';
import 'package:buddysigninwithui/core/constants/string_constant.dart';
import 'package:buddysigninwithui/core/constants/textstyle_constant.dart';
import 'package:buddysigninwithui/core/services/userdata_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDataAdd extends StatefulWidget {
  const UserDataAdd({super.key});

  @override
  State<UserDataAdd> createState() => _UserDataAddState();
}

class _UserDataAddState extends State<UserDataAdd> {
  TextEditingController nameController = TextEditingController();

  TextEditingController cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<UserDataService>(
        builder: (context, UserDataServiceprovider, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Add data'),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                    hintText: AppString.enterusername,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: cityController,
                decoration: InputDecoration(
                    hintText: AppString.enterusercity,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  UserDataServiceprovider.useradd(
                      context,
                      nameController.text.toString(),
                      cityController.text.toString());

                  nameController.text = '';
                  cityController.text = '';
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 58,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(colors: [
                        AppColors.adddataprimary,
                        AppColors.adddatasecondary
                      ])),
                  child: Text(
                    'Add',
                    style: AppTextStyle.adddatabutton,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
