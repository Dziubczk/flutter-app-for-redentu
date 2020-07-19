import 'package:flutter/material.dart';
import 'package:flutter_app_for_redentu/page/edit-user-page.dart';
import 'package:flutter_app_for_redentu/repository/auth-repository.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(23.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  AuthRepository.currentUser.name,
                  style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                ),
              ),
              FlatButton(
                child: Icon(Icons.edit),
                onPressed: () => onEditPressed(),
              ),
            ],
          ),
          SizedBox(
            height: 38,
          ),
          Text(
            "Phone",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(AuthRepository.currentUser.phone),
          SizedBox(
            height: 23,
          ),
          Text(
            "Email",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(AuthRepository.currentUser.email),
          SizedBox(
            height: 23,
          ),
          Text(
            "About",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(AuthRepository.currentUser.about),
        ],
      ),
    );
  }

  void onEditPressed() async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditUserPage(AuthRepository.currentUser),
        ));
    setState(() {
      AuthRepository.currentUser.phone = result[0];
      AuthRepository.currentUser.email = result[1];
      AuthRepository.currentUser.about = result[2];
    });
  }
}
