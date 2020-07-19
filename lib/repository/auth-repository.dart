import 'package:flutter_app_for_redentu/service/auth-controller.dart';
import 'package:flutter_app_for_redentu/model/user.dart';

class AuthRepository {
  static User get currentUser => _currentUser;
  static User _currentUser;

  static bool get isAuth => _isAuth;
  static bool _isAuth = false;

  static AuthService _service = new AuthService();

  static Future<void> logIn(login, password) async {
    _currentUser = _service.verification(login, password);
    _isAuth = currentUser != null;
  }

  static void logOut() {
    _currentUser = null;
    _isAuth = false;
  }
}
