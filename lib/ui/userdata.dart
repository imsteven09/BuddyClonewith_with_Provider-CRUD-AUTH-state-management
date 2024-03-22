import 'package:buddysigninwithui/core/constants/color_constant.dart';
import 'package:buddysigninwithui/core/constants/string_constant.dart';
import 'package:buddysigninwithui/core/services/login_service.dart';
import 'package:buddysigninwithui/core/services/userdata_service.dart';
import 'package:buddysigninwithui/ui/userdataaddpage.dart';
import 'package:buddysigninwithui/ui/userprofile.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserData extends StatefulWidget {
  final String uid;

  const UserData({super.key, required this.uid});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  SigninandsignupService signout = SigninandsignupService();

  final databaseref = FirebaseDatabase.instance.ref('Users Data');
  TextEditingController searcController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserDataService>(
        builder: (context, UserDataServiceprovider, child) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(widget.uid),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return UserProfile(
                      uid: widget.uid,
                    );
                  }));
                },
                icon: Icon(Icons.arrow_upward)),
            IconButton(
                onPressed: () {
                  signout.signout(context);
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              TextField(
                controller: searcController,
                onChanged: (String value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    hintText: AppString.entername,
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: FirebaseAnimatedList(
                      query: UserDataServiceprovider.databaseref,
                      defaultChild: Text("Loading"),
                      itemBuilder: (context, snapshot, animation, index) {
                        final name =
                            snapshot.child(AppString.name).value.toString();
                        final id =
                            snapshot.child(AppString.id).value.toString();
                        final city =
                            snapshot.child(AppString.city).value.toString();
                        if (searcController.text.isEmpty) {
                          return Container(
                            margin: EdgeInsets.only(top: 5),
                            child: ListTile(
                              tileColor: AppColors.textfield,
                              leading: Icon(Icons.person),
                              title: Text(snapshot
                                  .child(AppString.name)
                                  .value
                                  .toString()),
                              subtitle: Text(snapshot
                                  .child(AppString.city)
                                  .value
                                  .toString()),
                              trailing: PopupMenuButton(
                                  icon: Icon(Icons.more_vert),
                                  itemBuilder: (context) => [
                                        PopupMenuItem(
                                            value: 1,
                                            child: ListTile(
                                              onTap: () {
                                                Navigator.pop(context);
                                                UserDataServiceprovider
                                                    .useredit(name, id, city,
                                                        context);
                                              },
                                              leading: Icon(Icons.edit),
                                              title: Text(AppString.edit),
                                            )),
                                        PopupMenuItem(
                                            value: 2,
                                            child: ListTile(
                                              onTap: () {
                                                UserDataServiceprovider
                                                    .userdelete(snapshot);

                                                Navigator.pop(context);
                                              },
                                              leading: Icon(Icons.delete),
                                              title: Text(AppString.delete),
                                            ))
                                      ]),
                            ),
                          );
                        } else if (name.toLowerCase().contains(
                            searcController.text.toLowerCase().toString())) {
                          return Container(
                            margin: EdgeInsets.only(top: 5),
                            child: ListTile(
                              tileColor: AppColors.textfield,
                              leading: Icon(Icons.person),
                              title: Text(snapshot
                                  .child(AppString.name)
                                  .value
                                  .toString()),
                              subtitle: Text(snapshot
                                  .child(AppString.city)
                                  .value
                                  .toString()),
                              trailing: PopupMenuButton(
                                  icon: Icon(Icons.more_vert),
                                  itemBuilder: (context) => [
                                        PopupMenuItem(
                                            value: 1,
                                            child: ListTile(
                                              onTap: () {
                                                Navigator.pop(context);
                                                UserDataServiceprovider
                                                    .useredit(name, id, city,
                                                        context);
                                              },
                                              leading: Icon(Icons.edit),
                                              title: Text(AppString.edit),
                                            )),
                                        PopupMenuItem(
                                            value: 2,
                                            child: ListTile(
                                              onTap: () {
                                                UserDataServiceprovider
                                                    .userdelete(snapshot);

                                                Navigator.pop(context);
                                              },
                                              leading: Icon(Icons.delete),
                                              title: Text(AppString.delete),
                                            ))
                                      ]),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.darkblue,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return UserDataAdd();
              },
            ));
          },
          child: Icon(
            Icons.add,
            color: AppColors.aqua,
          ),
        ),
      );
    });
  }
}
