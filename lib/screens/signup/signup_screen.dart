import 'package:flutter/material.dart';
import 'package:simple_login/components/custom_text_form_field.dart';
import 'package:simple_login/constants.dart';
import 'package:simple_login/helper/validators.dart';
import 'package:simple_login/screens/login/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  static const routeName = '/signup';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  // * Text Field Controller
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // * TextField FocusNode
  final usnernameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
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
            child: LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Signup Form",
                            style: Theme.of(context).textTheme.headline1.copyWith(
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
                                fieldLabel: "Email Address",
                                controller: emailController,
                                focusNode: emailFocusNode,
                                validator: emailValidator,
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
                                  onPressed: () {}, child: Text("Signup")),
                              SizedBox(height: kDefaultPadding),
                              Container(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Already have account? ",
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
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
