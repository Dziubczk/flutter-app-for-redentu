import 'package:flutter/material.dart';
import 'package:flutter_app_for_redentu/model/user.dart';

class EditUserPage extends StatefulWidget {
  final User user;

  EditUserPage(this.user);

  @override
  _EditUserPageState createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final aboutCtrl = TextEditingController();

  @override
  void initState() {
    phoneCtrl.text = widget.user.phone;
    emailCtrl.text = widget.user.email;
    aboutCtrl.text = widget.user.about;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: phoneCtrl,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black)),
                  hintText: 'Phone'),
            ),
            TextField(
              controller: emailCtrl,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black)),
                  hintText: 'Email'),
            ),
            TextField(
              controller: aboutCtrl,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black)),
                  hintText: 'About'),
            ),
            RaisedButton(
              child: Text("Edit"),
              onPressed: () => onPressed(context),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    phoneCtrl.dispose();
    emailCtrl.dispose();
    aboutCtrl.dispose();
    super.dispose();
  }

  void onPressed(context) {
    Navigator.pop(context, [phoneCtrl.text, emailCtrl.text, aboutCtrl.text]);
  }
}
