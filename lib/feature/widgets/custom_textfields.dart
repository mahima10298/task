import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield(
      {super.key,
      required this.width,
      required this.keyboardType,
      this.enabled = true,
      this.hintText = "",
      this.hintTextcolor = Colors.grey,
      this.validation,
      this.onChanged,
      this.obsecureText = false,
      required this.controller,
      this.borderColor = Colors.white,
      this.inputTextColor = Colors.white,
      required this.focusNode});
  final double width;
  final TextInputType keyboardType;
  final bool enabled;
  final String hintText;
  final Color hintTextcolor;
  final bool obsecureText;
  final validation;
  final onChanged;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Color borderColor;
  final Color inputTextColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.number,
        style: GoogleFonts.montserrat(
          color: inputTextColor,
        ),
        obscureText: obsecureText,
        enabled: enabled,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.montserrat(color: hintTextcolor),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            contentPadding: EdgeInsets.symmetric(horizontal: 10)
            ),
        validator: validation,
        onChanged: onChanged,
        showCursor: true,
      ),
    );
  }
}
