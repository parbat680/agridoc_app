import 'package:localization/colored_print/print_color.dart';

class UserRepository {
  Future signUp(String username, String phone, String password) async {
    await Future.delayed(Duration(seconds: 3));
    print("username : $username, phone: $phone, password: $password");
  }

  Future login(String phone, String password) async {
    await Future.delayed(Duration(seconds: 3));
    if (phone == 'parbat@gmail.com' && password == '12345678') {
      return true;
    }
    return false;
  }

  Future persistToken(String token) async {
    await Future.delayed(Duration(seconds: 3));
  }

  Future deleteToken() async {
    await Future.delayed(Duration(seconds: 3));
  }

  Future hasToken() async {
    return false;
  }
}
