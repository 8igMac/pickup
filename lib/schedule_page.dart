import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'match_page.dart';
import 'navigation_page.dart';
import 'schedule_start_page.dart';

class DriverSchedulePage extends StatelessWidget {
  const DriverSchedulePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 33.w,
        right: 33.w,
        top: 46.h,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => NavigationPage(),
              //   ),
              // );
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PassengerMatchedPage()));
            },
            child: Container(
              width: 363.w,
              height: 481.h,
              foregroundDecoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/middle_schedule.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PassengerSchedulePage extends StatefulWidget {
  const PassengerSchedulePage({Key? key}) : super(key: key);

  @override
  State<PassengerSchedulePage> createState() => SchedulePageState();
}

class SchedulePageState extends State<PassengerSchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/passenger_schedule.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
