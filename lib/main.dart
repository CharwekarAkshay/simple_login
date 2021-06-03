import 'dart:html' as html;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_login/notifiers/authentication_notifier.dart';
import 'package:simple_login/screens/home/home_screen.dart';
import 'package:simple_login/screens/login/login_screen.dart';
import 'package:simple_login/screens/signup/signup_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => AuthenticationNotifier(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Login Logout',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Colors.blueAccent,
          ),
        ),
      ),
      initialRoute: SignupScreen.routeName,
      routes: {
        SignupScreen.routeName: (BuildContext context) => SignupScreen(),
        LoginScreen.routeName: (BuildContext context) => LoginScreen(),
        HomeScreen.routeName: (BuildContext context) => loginGuard(context, HomeScreen()),
      },
    );
  }
}

Widget loginGuard(BuildContext context, Widget widget) {
  bool isUserLogin = Provider.of<AuthenticationNotifier>(context).isUserLogin;
  if (isUserLogin) {
    return widget;
  } else {
    if (kIsWeb) {
      html.window.history.pushState(null, 'Login', '#/login');
    }
    return LoginScreen();
  }
}
