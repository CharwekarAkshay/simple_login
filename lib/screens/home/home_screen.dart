import 'package:flutter/material.dart';
import 'package:simple_login/constants.dart';
import 'package:simple_login/screens/login/login_screen.dart';
import 'package:simple_login/screens/signup/signup_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              "Home Screen",
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: kDefaultPadding * 2,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      SignupScreen.routeName,
                      (route) => false,
                    );
                  },
                  child: Text(
                    "Signup",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      LoginScreen.routeName,
                      (route) => false,
                    );
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
