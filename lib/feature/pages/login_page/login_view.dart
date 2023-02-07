import 'package:assignment_1/core/router/routers.dart';
import 'package:assignment_1/feature/pages/login_page/login_controller.dart';
import 'package:assignment_1/feature/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../utils/utils.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<LoginController>(context);
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
                  SIGNIN,
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 18.0.sp,
                      textStyle: TextStyle(fontWeight: FontWeight.w600)),
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
                  validation: (value) {
                    return Validators.validateEmail(value, context);
                  },
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 2.0.h),
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
                btnText: LOGIN,
                btnTxtcolor: Colors.white,
                btnFunction: () {
                  // if (formKey.currentState!.validate()) {
                  // Navigator.pushNamedAndRemoveUntil(
                  //     context, Routes.HOMEPAGE, (route) => false);
                  // }
                  Navigator.pushNamed(context, Routes.HOMEPAGE);
                },
              ),
              Container(
                margin:
                    EdgeInsets.symmetric(vertical: 2.0.h, horizontal: 10.0.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
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
                        context, Routes.REGISTERPAGE, (route) => false);
                  },
                  child: Text(
                    "Create an account? Sign up",
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
