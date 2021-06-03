import 'package:flutter/material.dart';
import 'package:simple_login/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.fieldLabel,
    required this.controller,
    required this.focusNode,
    required this.validator,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
  }) : super(key: key);

  final String fieldLabel;
  final bool obscureText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      focusNode: focusNode,
      textInputAction: textInputAction,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
        labelText: fieldLabel,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }
}
