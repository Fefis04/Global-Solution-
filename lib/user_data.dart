class UserData {
  static final UserData _singleton = UserData._internal();

  factory UserData() {
    return _singleton;
  }

  UserData._internal();

  String email = '';
  String senha = '';
  String usuario = ''; 
  bool isCadastrado = false; 
}

final userData = UserData();
