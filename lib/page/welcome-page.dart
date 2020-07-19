import 'package:flutter/material.dart';
import 'package:flutter_app_for_redentu/page/login-page.dart';
import 'package:flutter_app_for_redentu/page/news-page.dart';
import 'package:flutter_app_for_redentu/page/photo-page.dart';
import 'package:flutter_app_for_redentu/page/qr-generator.dart';
import 'package:flutter_app_for_redentu/page/anonymous-page.dart';
import 'package:flutter_app_for_redentu/page/user-page.dart';
import 'package:flutter_app_for_redentu/properties.dart';
import 'package:flutter_app_for_redentu/repository/auth-repository.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: Text(AuthRepository.isAuth
                ? AuthRepository.currentUser.name
                : APP_NAME),
            actions: <Widget>[
              AuthRepository.isAuth
                  ? FlatButton(
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: onLogOutPressed)
                  : FlatButton(
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: onLogInPressed),
            ],
            bottom: TabBar(//isScrollable: true,
                //indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
              Tab(
                  child: Text(
                'News',
                style: TextStyle(fontSize: 18),
              )),
              Tab(
                  child: Text(
                'Profile',
                style: TextStyle(fontSize: 18),
              )),
              Tab(
                  child: Text(
                'QR',
                style: TextStyle(fontSize: 18),
              )),
              Tab(
                  child: Text(
                'Photo',
                style: TextStyle(fontSize: 18),
              ))
            ]),
          ),
          body: TabBarView(children: <Widget>[
            NewsPage(),
            AuthRepository.isAuth ? UserPage() : AnonymousUserPage(),
            QRGeneratePage(),
            PhotoPage()
          ])),
    );
  }

  void onLogInPressed() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
    setState(() {});
  }

  void onLogOutPressed() {
    AuthRepository.logOut();
    setState(() {});
  }
}
