import 'package:flutter/material.dart';

class OTPScreenState extends StatefulWidget {
  OTPScreenState({Key key}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreenState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text('Login screen '),
      ),
    );
  }
}
