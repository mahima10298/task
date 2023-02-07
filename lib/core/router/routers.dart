import 'package:assignment_1/feature/pages/add_task_page/add_task_view.dart';
import 'package:assignment_1/feature/pages/home_page/home_view.dart';
import 'package:assignment_1/feature/pages/login_page/login_view.dart';
import 'package:assignment_1/feature/pages/register_page/register_screen.dart';
import 'package:assignment_1/feature/pages/splash_screen/splash_screen.dart';
import 'package:assignment_1/feature/utils/string.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String INITIAL = "/";
  static const String HOMEPAGE = "/home";
  static const String LOGINPAGE = "/login";
  static const String REGISTERPAGE = "/register";
  static const String ADDTASKPAGE = "/addtask";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case INITIAL:
        return MaterialPageRoute(
            settings: RouteSettings(name: INITIAL),
            builder: (BuildContext context) => SplashScreenView());

      case HOMEPAGE:
        return MaterialPageRoute(
            settings: RouteSettings(name: HOMEPAGE),
            builder: (BuildContext context) => HomePage());

      case LOGINPAGE:
        return MaterialPageRoute(
            settings: RouteSettings(name: LOGINPAGE),
            builder: (BuildContext context) => LoginView());

      case REGISTERPAGE:
        return MaterialPageRoute(
            settings: RouteSettings(name: REGISTERPAGE),
            builder: (BuildContext context) => RegisterView());
      
      case ADDTASKPAGE:
        return MaterialPageRoute(
            settings: RouteSettings(name: ADDTASKPAGE),
            builder: (BuildContext context) => AddTaskView());

      default:
        return MaterialPageRoute(
            settings: RouteSettings(name: INITIAL),
            builder: (BuildContext context) => SplashScreenView());
    }
  }
}
