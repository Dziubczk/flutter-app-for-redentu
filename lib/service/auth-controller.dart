import 'package:flutter_app_for_redentu/custom-database.dart';
import 'package:flutter_app_for_redentu/model/user.dart';

class AuthService {
  User verification(String login, String password) {
    User _user = CustomMockDatabase.user;
    return (_user.name == login && _user.password == password) ? _user : null;
  }
}
