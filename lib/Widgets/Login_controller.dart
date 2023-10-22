// ignore_for_file: unused_element, non_constant_identifier_names, unused_local_variable, unnecessary_statements, cancel_subscriptions

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  var _googleSignin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  //var authAccount = Rx<FirebaseAuth.instance.currentUser?>(null);
  var authAccount = Rx<FirebaseAuth?>(null);

// login with google acount 
  login() async {
    //_googleSignin.signIn();
    googleAccount.value = await _googleSignin.signIn();
  }
  logout() async {
    //_googleSignin.signIn();
    googleAccount.value = await _googleSignin.signOut();
  }
  showSnack(String titulo, String erro) {
    Get.snackbar(titulo,erro,
      backgroundColor: Colors.grey[900],
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }


  // login with personal  email

  Future<void> Loginwithemail (String email, String password) async {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
  }

  Future<void> Register(String email, String password, String passwordconfirm) async {
      if (password == passwordconfirm) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email.trim(), password: password.trim());
      }
    }
  
  Future<void> logout_acount() async {
      try {
        await FirebaseAuth.instance.signOut();
      } catch (e) {       
        showSnack('Erro ao sair!', e.toString());
      }

    }
    /*
    Future<void> nongoogleuserinfo() async {
      final authAccount.value =
      final uid = user.uid;
  
  }
*/
static Future<User?> refreshUser(User user) async {
  FirebaseAuth auth = FirebaseAuth.instance;

  await user.reload();
  User? refreshedUser = auth.currentUser;

  return refreshedUser;
}

Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ProfilePage(
            user: user,
          ),
        ),
      );
    }
    return firebaseApp;
}

}

  
