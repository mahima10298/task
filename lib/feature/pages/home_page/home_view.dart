import 'package:assignment_1/core/router/routers.dart';
import 'package:assignment_1/feature/pages/home_page/home_controller.dart';
import 'package:assignment_1/feature/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<HomeController>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  Asset.homePageImg,
                  fit: BoxFit.fill,
                ),
              ),
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                // leading: Icon(Icons.dehaze),
                // title: Text("Stack Overflow"),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.15,
                left: 20,
                right: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  "Your Things",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 32,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.29,
                left: 20,
                right: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  DateFormat('MMM d, y').format(DateTime.now()),
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.18,
                  right: 20,
                  left: MediaQuery.of(context).size.width * 0.6,
                  child: Row(
                    children: [
                      _numberOfType("29", "Personal"),
                      SizedBox(
                        width: 18,
                      ),
                      _numberOfType("12", "Business"),
                    ],
                  )),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.29,
                  left: MediaQuery.of(context).size.width * 0.7,
                  right: 10,
                  child: Row(
                    children: [
                      new CircularPercentIndicator(
                        radius: 10.0,
                        lineWidth: 2.0,
                        percent: 0.6,
                        center: new Text(""),
                        progressColor: blueColor,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "65% Done",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0, top: 8.0),
            child: Text(
              "INBOX",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 0),
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Divider(
                    thickness: 2,
                  ),
                );
              },
              itemCount: 15,
              itemBuilder: (context, i) {
                return ListTile(
                  // dense: true,
                  // isThreeLine: true,
                  leading: Container(
                      // margin: EdgeInsets.symmetric(vertical: 2.0.h),
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(80)),
                      child: Icon(
                        Icons.notifications_active_outlined,
                        color: blueColor,
                        size: 20.0,
                      )),
                  title: Text(
                    "questions.question",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "data",
                      style: TextStyle(
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                  ),
                  trailing: Text(
                    DateFormat('MMM d, y').format(DateTime.now()),
                    style: TextStyle(
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                );
              },
            ),
          ),
          Divider(
            thickness: 2,
          ),
          Padding(
            padding: EdgeInsets.only(top: 4.0, left: 16),
            child: Row(
              children: [
                Text(
                  "Completed",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                CircleAvatar(
                  radius: 10,
                  child: Text(
                    "5",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                  backgroundColor: Colors.grey,
                )
              ],
            ),
          )
        ],
      ),
      drawer: DrawerWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.ADDTASKPAGE);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
        backgroundColor: blueColor,
      ),
    );
  }

  _numberOfType(String number, String type) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
              color: Colors.white70, fontSize: 26, fontWeight: FontWeight.w500),
        ),
        Text(
          type,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
