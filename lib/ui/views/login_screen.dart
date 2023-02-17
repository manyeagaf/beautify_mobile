// ignore_for_file: prefer_const_constructors

import 'package:beautify/core/services/api/order_api.dart';
import 'package:beautify/core/services/auth/google_sign_in.dart';
import 'package:beautify/ui/shared/app_colors.dart';
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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 45.0,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kPrimaryColor)),
                onPressed: () {},
                child: Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 2.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Or",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 2.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Continue with social login",
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage:
                        AssetImage("assets/images/facebook_logo.png"),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage:
                        AssetImage("assets/images/google_logo.png"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
