import 'package:assignment_1/core/router/routers.dart';
import 'package:assignment_1/feature/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'feature/pages/add_task_page/add_task_controller.dart';
import 'feature/pages/home_page/home_controller.dart';
import 'feature/pages/login_page/login_controller.dart';
import 'feature/pages/register_page/register_controller.dart';
import 'feature/pages/splash_screen/splash_controller.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SplashController>(create: (_) => SplashController()),
        Provider<LoginController>(create: (_) => LoginController()),
        Provider<HomeController>(create: (_) => HomeController()),
        Provider<AddTaskController>(create: (_) => AddTaskController()),
        Provider<RegisterController>(create: (_) => RegisterController()),
      ],
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.light(primary: Colors.white),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            timePickerTheme: TimePickerThemeData(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                hourMinuteShape: const CircleBorder(),
                dialTextColor: blueColor,
                dayPeriodTextColor: blueColor,
                hourMinuteTextColor: blueColor,
                helpTextStyle: TextStyle(color: blueColor),
                entryModeIconColor: blueColor),
                textButtonTheme: TextButtonThemeData(style: 
                ButtonStyle(
      textStyle: MaterialStateTextStyle.resolveWith(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return TextStyle(color: blueColor);
          }
          return TextStyle(color: blueColor);
        },
      ),
                )
      )
                // textTheme: Text
            // primarySwatch: colorPrimary,
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routes.generateRoute,
          initialRoute: Routes.INITIAL,
          navigatorKey: GlobalKey<NavigatorState>(),
          // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      }),
    );
  }
}
