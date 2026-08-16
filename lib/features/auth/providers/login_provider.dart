import 'package:evently/core/router/routes_name.dart';
import 'package:evently/core/services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum LoginStates { initial, loading, success, failure }

class LoginProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginStates loginStates = LoginStates.initial;

  Future<void> login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        loginStates = LoginStates.loading;
        notifyListeners();

        await FirebaseServices.login(
          email: emailController.text,
          password: passwordController.text,
        );
        loginStates = LoginStates.success;

        if (context.mounted) {
          Navigator.pushReplacementNamed(context, RoutesName.mainLayoutScreen);
        }

        Fluttertoast.showToast(
          msg: "Logged in successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        notifyListeners();
      } catch (e) {
        loginStates = LoginStates.failure;
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

  // import 'package:google_sign_in/google_sign_in.dart';

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn.instance.authenticate();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(idToken: googleAuth?.idToken);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
