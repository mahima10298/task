import 'package:assignment_1/core/router/routers.dart';
import 'package:assignment_1/feature/utils/asset.dart';
import 'package:assignment_1/feature/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

class SplashScreenView extends StatefulWidget {
  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorPrimary,
      body: SizedBox(
        height: size.height,
        // padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.LOGINPAGE);
              // Get.to(()=>LoginView(), binding: LoginBinding());
            },
            child: Image.asset(
              Asset.addTaskLogo,
              height: 30.h,
            ),
          ),
        ),
      ),
    );
  }
}
