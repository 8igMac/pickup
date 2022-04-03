import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditSchedulePage extends StatelessWidget {
  const EditSchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(
          left: 51.w,
          right: 51.w,
          top: 143.h,
          bottom: 147.h,
        ),
        child: GestureDetector(
          onTap: () {
            // TODO: add schedule
          },
          child: Container(
            foregroundDecoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/schedule.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}