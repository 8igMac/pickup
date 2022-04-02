import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickup/color.dart';
import 'package:pickup/edit_schedule_page.dart';

class DriverHomePage extends StatelessWidget {
  const DriverHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 32.w,
        right: 32.w,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 364.w,
            height: 509.h,
            decoration: BoxDecoration(
              color: MyColors.yellow,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Column(
              children: [
                SizedBox(height: 24.h),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    fixedSize:
                        MaterialStateProperty.all<Size>(Size(325.w, 56.h)),
                  ),
                  child: Text(
                    'EDIT SCHEDULE',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditSchedulePage(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 24.h),
                Container(
                  width: 325.w,
                  height: 200.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  foregroundDecoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/calender.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 42.h),
                Container(
                  width: 270.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  foregroundDecoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/mile.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    fixedSize:
                        MaterialStateProperty.all<Size>(Size(295.w, 44.h)),
                  ),
                  onPressed: null,
                  child: Text(
                    'ADD EVENT',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 364.w,
            height: 150.h,
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              image: DecorationImage(
                image: AssetImage('assets/images/map.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
