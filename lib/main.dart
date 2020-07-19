import 'package:flutter_app_for_redentu/page/welcome-page.dart';
import 'package:flutter/material.dart';

void main() => runApp(AppForRedentu());

class AppForRedentu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
    );
  }
}
