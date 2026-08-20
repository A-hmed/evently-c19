import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class FirebaseServices {
  static Future registerUserInFirestore(UserModel user) async {
    var collection =
        FirebaseFirestore.instance.collection(UserModel.collectionName);
    collection.doc(user.id).set(user.toJson());
  }

  static Future<UserModel> getUserFromFirestore(String id) async {
    var collection =
        FirebaseFirestore.instance.collection(UserModel.collectionName);
    var docSnapshot = await collection.doc(id).get();
    Map<String, dynamic> json = docSnapshot.data() ?? {};
    return UserModel.fromJson(json);
  }

  static Future<bool> isUserExist(String id) async {
    var collection =
        FirebaseFirestore.instance.collection(UserModel.collectionName);
    var docSnapshot = await collection.doc(id).get();
    return docSnapshot.exists;
  }

  static Future<User?> createAccount({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user?.updateDisplayName(name);

      ///Register user in firestore
      UserModel.currentUser = UserModel(
        id: credential.user!.uid,
        name: name,
        email: email,
        favorites: [],
      );
      registerUserInFirestore(UserModel.currentUser!);

      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        throw "The account already exists for that email.";
      }
    } catch (e) {
      rethrow;
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
      UserModel.currentUser = await getUserFromFirestore(credential.user!.uid);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        throw "Wrong password provided for that user.";
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  static Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn.instance.authenticate();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.user != null) {
        bool exists = await isUserExist(userCredential.user!.uid);
        if (!exists) {
          UserModel.currentUser = UserModel(
            id: userCredential.user!.uid,
            name: userCredential.user!.displayName ?? "",
            email: userCredential.user!.email ?? "",
            favorites: [],
          );
          await registerUserInFirestore(UserModel.currentUser!);
        } else {
          UserModel.currentUser =
              await getUserFromFirestore(userCredential.user!.uid);
        }
      }

      return userCredential.user;
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn.instance.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
