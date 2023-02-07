import 'package:flutter/material.dart';

class Validators {
  static String validateEmail(String value, BuildContext context) {
    var regExp = RegExp(
        // r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+\.[a-zA-Z]+");
    if (value.isEmpty) {
      return "Enter a  Email";
    } else if (!regExp.hasMatch(value)) {
      return "Enter a Valid Email";
    } else {
      return "";
    }
  }

  static String validateEmptyField(String number, BuildContext context) {
    if (!(number.trim().length > 0)) {
      return "Field cannot be empty";
    } else {
      return "";
    }
  }
}
