import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier{
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode pwFocusNode = FocusNode();
}