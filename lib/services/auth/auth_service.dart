import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<UserCredential> signInWithEmailPass(String email, String pass) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: pass);
      firebaseFirestore
          .collection('messaging')
          .doc(userCredential.user!.uid)
          .set({
        "uid": userCredential.user!.uid,
        "email": userCredential.user!.email
      }, SetOptions(merge: true));
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<UserCredential> signUpWithEmailPass(String email, String pass) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: pass);

      firebaseFirestore
          .collection('messaging')
          .doc(userCredential.user!.uid)
          .set({
        "uid": userCredential.user!.uid,
        "email": userCredential.user!.email
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }
}
