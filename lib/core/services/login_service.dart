import 'dart:async';

import 'package:buddysigninwithui/core/services/home.dart';
import 'package:buddysigninwithui/core/services/loginwithphone/phoneverify.dart';
import 'package:buddysigninwithui/ui/userdata.dart';
//import 'package:buddysigninwithui/core/services/login_page.dart';
//import 'package:buddysigninwithui/ui/userinfo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SigninandsignupService extends ChangeNotifier {
  static void islogin(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;

    if (user != null) {
      String id = user.uid.toString();
      Timer(Duration(seconds: 2), () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return UserData(uid: id);
        }));
      });
    } else {
      Timer(Duration(seconds: 2), () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Home();
        }));
      });
    }
  }

  void signupservice(
      BuildContext context, String username, String email, String password) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final userref = FirebaseDatabase.instance.ref().child('Users');
    _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      userref.child(value.user!.uid.toString()).set({
        'uid': value.user!.uid.toString(),
        'email': value.user!.email.toString(),
        'name': username,
        'phone': '',
        'profile': ''
      });
    }).then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Signedup')));
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('error')));
    });
    notifyListeners();
  }

  void signinservice(BuildContext context, String email, String password) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      String id = value.user!.uid.toString();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return UserData(uid: id);
      }));
    }).onError((error, stackTrace) {});
    notifyListeners();
  }

  void googlesignin(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;

    final userref = FirebaseDatabase.instance.ref().child('Users');
    GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
    _auth.signInWithProvider(_googleAuthProvider).then((value) {
      String id = value.user!.uid.toString();
      userref.child(value.user!.uid.toString()).set({
        'uid': value.user!.uid.toString(),
        'email': value.user!.email.toString(),
        'name': 'Null',
        'phone': '',
        'profile': ''
      });

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return UserData(uid: id);
      }));
    }).onError((error, stackTrace) {
      print('error');
    });
    notifyListeners();
  }

  void signout(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.signOut().then((value) {
      return Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Home();
      }));
    }).onError((error, stackTrace) => ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('error'))));
    notifyListeners();
  }

  void loginwithphone(String phoneController, context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth.verifyPhoneNumber(
        phoneNumber: phoneController,
        verificationCompleted: (_) {},
        verificationFailed: (e) {
          print(e.toString());
        },
        codeSent: (String verifificatonId, int? token) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PhoneLoginVerify(verificationId: verifificatonId);
          }));
        },
        codeAutoRetrievalTimeout: (e) {
          print('Timeout');
        });
    notifyListeners();
  }

  void phoneverify(
      BuildContext context, String codeController, String verificationId) {
    FirebaseAuth auth = FirebaseAuth.instance;

    final userref = FirebaseDatabase.instance.ref().child('Users');

    final credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: codeController);

    auth.signInWithCredential(credential).then((value) {
      String id = value.user!.uid.toString();
      userref.child(value.user!.uid.toString()).set({
        'uid': value.user!.uid.toString(),
        'email': value.user!.email.toString(),
        'name': 'Null',
        'phone': '',
        'profile': ''
      });

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return UserData(uid: id);
      }));
    }).onError((error, stackTrace) {
      print('error');
    });
    ;

    notifyListeners();
  }
}
