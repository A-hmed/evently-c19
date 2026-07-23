import 'dart:developer';

import 'package:evently/core/router/routes_name.dart';
import 'package:evently/core/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum SignUpState { initial, loading, success, failure }

class SignUpProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  SignUpState state = SignUpState.initial;

  Future<void> signUp(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        state = SignUpState.loading;
        notifyListeners();
        final user = await FirebaseServices.createAccount(
          email: emailController.text,
          password: passwordController.text,
        );

        log(user?.uid ?? "");
        log(user?.email ?? "");

        state = SignUpState.success;
        if (context.mounted) {
          Navigator.pushReplacementNamed(context, RoutesName.loginScreen);
        }
        Fluttertoast.showToast(
          msg: "Account Created Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        notifyListeners();
      } catch (e) {
        state = SignUpState.failure;
        Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        notifyListeners();
      }
    }
  }
}
