class User {
  String get name => _name;
  final String _name;

  String get password => _password;
  final String _password;

  String phone = '';
  String email = '';
  String about = '';

  User(this._name, this._password);
}
