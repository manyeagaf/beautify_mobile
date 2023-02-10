import 'package:beautify/core/services/auth/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AccessToken? _accessToken;
  Map<String, dynamic>? _userData;
  bool _checking = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _checkIfIsLoggedIn() async {
    final accessToken = await FacebookAuth.instance.accessToken;
    setState(() {
      _checking = false;
    });
    if (accessToken != null) {
      final userData = await FacebookAuth.instance.getUserData();
      _accessToken = accessToken;
      print(accessToken.toJson());
      setState(() {
        _userData = userData;
        print(_userData);
      });
    } else {
      _login();
    }
  }

  _login() async {
    final LoginResult results = await FacebookAuth.instance.login();
    if (results.status == LoginStatus.success) {
      _accessToken = results.accessToken;
      print(_accessToken);

      final userData = await FacebookAuth.instance.getUserData();
      _userData = userData;
      print(_userData);
    } else {
      print(results.status);
      print(results.message);
    }
  }

  _logout() async {
    await FacebookAuth.instance.logOut();
    _accessToken = null;
    _userData = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                _logout();
              },
              child: Text("Logout"),
            ),
            TextButton(
              onPressed: () async {
                final cred = await GoogleSignInApi.login();
                final ggAuth = await cred!.authentication;
                print(cred);
                print(ggAuth.accessToken);
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
