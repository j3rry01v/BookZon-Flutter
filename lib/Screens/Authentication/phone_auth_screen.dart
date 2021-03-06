import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/services/phoneauth_service.dart';

class PhoneAuthScreen extends StatefulWidget {
  static const String id = 'phone-auth-screen';

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  bool validate = false;
  var countryCodeController = TextEditingController(text: '+91');

  var phoneNumberController = TextEditingController();

  showAlertDialogue(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(
            width: 8,
          ),
          Text('Please Wait')
        ],
      ),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  PhoneAuthService _service = PhoneAuthService();

  phoneAuthentication(number) {
    print(number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Login",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.purple.shade700,
              child: Icon(
                CupertinoIcons.phone_fill,
                color: Colors.grey.shade500,
                size: 40,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Enter your phone ',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "We will send you a confirmation code",
              style: TextStyle(color: Colors.grey),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    controller: countryCodeController,
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: "Country ",
                      labelStyle: TextStyle(color: Colors.grey.shade400),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length == 10) {
                        setState(() {
                          validate = true;
                        });
                      }
                      if (value.length < 10) {
                        setState(() {
                          validate = false;
                        });
                      }
                    },
                    autofocus: true,
                    keyboardType: TextInputType.phone,
                    scrollPadding: EdgeInsets.all(22),
                    maxLength: 10,
                    controller: phoneNumberController,
                    enabled: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(22),
                      labelText: "Number ",
                      hintText: "Enter your phone number",
                      hintStyle:
                          TextStyle(fontSize: 10, color: Colors.grey.shade400),
                      labelStyle: TextStyle(color: Colors.grey.shade400),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: AbsorbPointer(
            absorbing: validate == true ? false : true,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: validate == true
                        ? MaterialStateProperty.all(
                            Theme.of(context).primaryColor)
                        : MaterialStateProperty.all(Colors.grey)),
                onPressed: () {
                  String number =
                      '${countryCodeController.text}${phoneNumberController.text}';
                  showAlertDialogue(context);
                  _service.verifyPhoneNumber(context, number);
                  // phoneAuthentication(number);
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Next",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
