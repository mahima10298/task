import 'package:assignment_1/core/router/routers.dart';
import 'package:assignment_1/feature/pages/register_page/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../utils/utils.dart';
import '../../widgets/widgets.dart';

class RegisterView extends StatefulWidget {
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<RegisterController>(context);
    return Scaffold(
      backgroundColor: colorPrimary,
      body: Form(
        key: formKey,
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Asset.addTaskLogo,
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.0.h),
            child: Text(
              SIGNUP,
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 18.0.sp,
                  textStyle: TextStyle(fontWeight: FontWeight.w600)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 2.0.h),
            child: CustomTextfield(
              controller: _controller.nameController,
              focusNode: _controller.nameFocusNode,
              width: 75.0.w,
              keyboardType: TextInputType.emailAddress,
              hintText: USERNAME,
              hintTextcolor: Colors.white,
              validation: (value) {
               return Validators.validateEmptyField(value, context);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0.w,
            ),
            child: CustomTextfield(
              controller: _controller.emailController,
              focusNode: _controller.emailFocusNode,
              width: 75.0.w,
              keyboardType: TextInputType.emailAddress,
              hintText: EMAIL,
              hintTextcolor: Colors.white,
              validation: (text) {
               return Validators.validateEmail(text, context);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 2.0.h),
            child: CustomTextfield(
              controller: _controller.pwController,
              focusNode: _controller.pwFocusNode,
              width: 75.0.w,
              hintTextcolor: Colors.white,
              keyboardType: TextInputType.visiblePassword,
              hintText: PASSWORD,
              obsecureText: true,
              validation: (value) {
               return Validators.validateEmptyField(value, context);
              },
            ),
          ),
          CustomElevatedButton(
            btnText: REGISTER,
            btnTxtcolor: Colors.white,
            btnFunction: () {
              if (formKey.currentState!.validate()) {
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.LOGINPAGE, (route) => false);
              }
            },
            // edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 12.0.w),)
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.0.h, horizontal: 10.0.w),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(100)),
            child: Image.asset(
              Asset.googleBtn,
              fit: BoxFit.cover,
              height: 5.h,
              width: 75.0.w,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0.5.h),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.LOGINPAGE, (route) => false);
              },
              child: Text(
                "Already Register? Sign in",
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 10.0.sp,
                    textStyle: TextStyle(fontWeight: FontWeight.w500)),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
