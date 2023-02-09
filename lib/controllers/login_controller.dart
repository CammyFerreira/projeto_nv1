import 'package:flutter/foundation.dart';

class LoginController {

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  String? _login;
  setLogin(String value) => _login = value;

  String? _pass;
  setPass(String value) => _pass = value;

  Future<bool> auth() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    return _login == 'camis' && _pass == '123';
  }
}
