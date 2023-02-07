import 'package:flutter/material.dart';

class RegisterController extends ChangeNotifier{
  TextEditingController nameController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode pwFocusNode = FocusNode();
}