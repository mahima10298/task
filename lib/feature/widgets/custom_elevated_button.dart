import 'package:assignment_1/feature/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CustomElevatedButton extends StatelessWidget {
   CustomElevatedButton(
      {super.key,
      this.borderRadius = 10,
      required this.btnText,
      this.btnFunction,
      this.btnTxtcolor = colorPrimary,
      this.btnColor = blueColor,
      this.btnTextWeight = FontWeight.w700,
      this.btnTextSize = 18,
      // required this.edgeInsetsGeometry
      });
  final String btnText;
  final double borderRadius;
  final btnFunction;
  final Color btnTxtcolor;
  final Color btnColor;
  final FontWeight btnTextWeight;
  final double btnTextSize;
  // final EdgeInsetsGeometry edgeInsetsGeometry;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0.w),
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(1),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius)),
              backgroundColor: btnColor,
              elevation: 4,
              surfaceTintColor: btnColor),
          child: Center(
            child: Text(
              btnText,
              style: GoogleFonts.montserrat(
                color: btnTxtcolor,
                fontWeight: btnTextWeight,
                fontSize: btnTextSize,
              ),
            ),
          ),
          onPressed: btnFunction,
        ));
  }
}
