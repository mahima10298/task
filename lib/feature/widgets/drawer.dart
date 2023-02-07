import 'package:assignment_1/core/router/routers.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/utils.dart';

class DrawerWidget extends StatelessWidget {
  List<String> _pages = [ "Log out"];


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: colorPrimary,
      elevation: 10,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.0.h),
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(Asset.profileImg),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 3.0.w),
              child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                        color: Colors.white,
                        height: 10,
                        thickness: 2,
                      ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _pages.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () => {Navigator.pushNamedAndRemoveUntil(
                        context, Routes.LOGINPAGE, (route) => false)
                        },
                        //
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      _pages[index],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0.sp),
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ]),
                        ));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}