import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_for_redentu/properties.dart';
import 'package:flutter_app_for_redentu/repository/auth-repository.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final nameCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  String message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APP_NAME)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black)),
                  hintText: 'Name'),
            ),
            TextField(
              controller: passCtrl,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black)),
                  hintText: 'Password'),
            ),
            Text(
              message,
              style: TextStyle(color: Colors.red),
            ),
            OutlineButton(
              child: Text('Log in'),
              onPressed: () => onPressed(context),
            )
          ],
        ),
      ),
    );
  }

  void onPressed(context) {
    AuthRepository.logIn(nameCtrl.text, passCtrl.text);
    if (AuthRepository.isAuth) {
      Navigator.pop(context);
    } else {
      setState(() {
        message = 'Wrong login or password';
      });
    }
  }
}
