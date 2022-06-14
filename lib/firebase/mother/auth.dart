import 'package:bi_tracer/screens/mother/home.dart';
import 'package:bi_tracer/screens/mother/login.dart';
import 'package:bi_tracer/shared/mother/constants.dart';
import 'package:bi_tracer/shared/mother/navigator.dart';
import 'package:bi_tracer/shared/mother/snacbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Auth {
//////////////////////////////////////////////////////////////////////////////////////

  Future login(String email, String password, context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      if (userCredential != null) {
        checkLog(context, userCredential.user!.uid);
        uid = userCredential.user!.uid;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(snac('User not found'));
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(snac('Wrong Password'));
      }

      print('Wrong password provided for that user.');
    }
  }

  static logout(fun) {
    FirebaseAuth.instance.signOut().then((value) => fun);
    uid = '';
  }
}

checkLog(BuildContext context, String uid) async {
  // Navigator.pushReplacementNamed(context, FirstScreen.id);
  final log =
      await FirebaseFirestore.instance.collection('mothers').doc(uid).get();

  log.data() != null
      ? navigateReplacement(context: context, route: HomeM())
      : ScaffoldMessenger.of(context).showSnackBar(snac('User not found'));
}
