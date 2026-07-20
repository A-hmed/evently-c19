import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseServices {
  static Future<User?> createAccount({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
        return null;
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
    return null;
  }

  static Future<User?> login({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
        return null;
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
    return null;
  }
}
