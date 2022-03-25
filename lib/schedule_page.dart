import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DriverSchedulePage extends StatelessWidget {
  const DriverSchedulePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/schedule_page.png'),
          fit: BoxFit.fill,
        ),
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
