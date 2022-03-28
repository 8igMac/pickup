import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'match_page.dart';

class DriverSchedulePage extends StatelessWidget {
  const DriverSchedulePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   foregroundDecoration: BoxDecoration(
    //     image: DecorationImage(
    //       image: AssetImage('assets/images/schedule_page.png'),
    //       fit: BoxFit.fill,
    //     ),
    //   ),
    // );
    return Padding(
      padding: EdgeInsets.only(
        left: 33.w,
        right: 33.w,
        top: 46.h,
      ),
      child: Column(
        children: [
          Container(
            width: 363.w,
            height: 481.h,
            foregroundDecoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/middle_schedule.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 67.h),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MatchPage(),
                ),
              );
            },
            child: Container(
              width: 120.w,
              height: 72.h,
              foregroundDecoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/envelope.png'),
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

class PassengerSchedulePage extends StatelessWidget {
  const PassengerSchedulePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          'Passenger schedule page.',
          style: TextStyle(
            fontSize: 24.sp,
          ),
        ),
      ),
    );
  }
}
