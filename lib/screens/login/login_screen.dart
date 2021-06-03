import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_login/components/custom_text_form_field.dart';
import 'package:simple_login/constants.dart';
import 'package:simple_login/helper/validators.dart';
import 'package:simple_login/notifiers/authentication_notifier.dart';
import 'package:simple_login/screens/home/home_screen.dart';
import 'package:simple_login/screens/signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  // * Text Field Controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // * TextField FocusNode
  final usnernameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  loginUser(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      String username = usernameController.text;
      String password = passwordController.text;
      if (username != "" &&
          password != "" &&
          username == "AkshayCharwekar" &&
          password == "password") {
        Provider.of<AuthenticationNotifier>(context, listen: false).userLogin();
        Navigator.pushNamed(context, HomeScreen.routeName);
      } else {
        final snackBar = SnackBar(
            content: Text("Please check your creds!!"),
            backgroundColor: Colors.redAccent);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding / 2,
            ),
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Login Form",
                        style: Theme.of(context).textTheme.headline1?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomTextFormField(
                            fieldLabel: "Username",
                            controller: usernameController,
                            focusNode: usnernameFocusNode,
                            validator: requiredFieldValidator("Username"),
                          ),
                          SizedBox(height: kDefaultPadding),
                          CustomTextFormField(
                            fieldLabel: "Password",
                            controller: passwordController,
                            focusNode: passwordFocusNode,
                            textInputAction: TextInputAction.done,
                            obscureText: true,
                            validator: passwordValidator,
                          ),
                          SizedBox(height: kDefaultPadding),
                          TextButton(
                              onPressed: () {
                                loginUser(context);
                              },
                              child: Text("Login")),
                          SizedBox(height: kDefaultPadding),
                          Container(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have account? ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      SignupScreen.routeName,
                                      (route) => false,
                                    );
                                  },
                                  child: Text(
                                    "SignUp",
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
                                      HomeScreen.routeName,
                                      (route) => false,
                                    );
                                  },
                                  child: Text(
                                    "HomeScreen",
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
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
