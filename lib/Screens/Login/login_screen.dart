import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/body.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login-sceen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
