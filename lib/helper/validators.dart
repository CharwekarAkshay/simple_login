String? Function(String?) emailValidator = (value) {
  if (value == null || value.isEmpty) {
    return 'Please enter Email';
  }
  if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value)) {
    return 'Please enter valid email address';
  }
  return null;
};

String? Function(String?) passwordValidator = (value) {
  if (value == null || value.isEmpty) {
    return 'Please enter Password';
  }
  if (value.length < 6) {
    return "Password to short";
  }
  return null;
};

String? Function(String?) Function(String) requiredFieldValidator =
    (String fieldName) {
  return (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter $fieldName';
    }
    return null;
  };
};
