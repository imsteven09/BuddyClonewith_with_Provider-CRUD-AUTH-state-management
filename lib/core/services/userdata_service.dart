import 'package:buddysigninwithui/core/constants/string_constant.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UserDataService extends ChangeNotifier {
  final databaseref = FirebaseDatabase.instance.ref('People data');

  void useradd(BuildContext context, String name, String city) {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    databaseref.child(id).set({
      AppString.name: name,
      AppString.city: city,
      AppString.id: id
    }).then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Data Added')));
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    });

    notifyListeners();
  }

  void userdelete(snapshot) {
    databaseref
        .child(snapshot.child(AppString.id).value.toString())
        .remove()
        .then((value) => {
              print('success'),
            })
        .onError((error, stackTrace) => {print(error.toString())});

    notifyListeners();
  }

  Future<void> useredit(String name, String id, String city, context) async {
    TextEditingController editController = TextEditingController();
    editController.text = name;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Edit'),
              content: Container(
                child: TextField(
                  controller: editController,
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("cancel")),
                TextButton(
                    onPressed: () {
                      databaseref
                          .child(id)
                          .update({
                            AppString.name: editController.text.toString(),
                            AppString.city: city,
                            AppString.id: id
                          })
                          .then((value) => {print('success')})
                          .onError(
                              (error, stackTrace) => {print(error.toString())});

                      Navigator.pop(context);
                    },
                    child: Text("Update"))
              ]);
        });
  }

  // void userprofile(BuildContext context) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return Container(
  //           padding: EdgeInsets.all(10),
  //           height: 150,
  //           width: MediaQuery.of(context).size.width,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [Text('From other class'), Text('same class')],
  //           ),
  //         );
  //       });
  // }
  
}
