import 'package:flutter/cupertino.dart';

class AuthenticationNotifier with ChangeNotifier {
  bool isUserLogin = false;

  void userLogin() {
    isUserLogin = true;
    notifyListeners();
  }

  
}