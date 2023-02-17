import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController with ChangeNotifier {
  static final _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleAccount;

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
  logout() async {
    await _googleSignIn.signOut();
  }
}
