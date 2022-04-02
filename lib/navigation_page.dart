import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickup/color.dart';
import 'package:pickup/complete_page.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 67.h),
          Text(
            'step1: Pick up Annie',
            style: TextStyle(
              fontSize: 36.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 29.h),
          Container(
            width: 379.w,
            height: 516.h,
            foregroundDecoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/navigation_map.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 26.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'GO STRAIGHT',
                style: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Icon(
                Icons.arrow_upward,
                size: 50.w,
              ),
            ],
          ),
          SizedBox(height: 30.h),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(MyColors.red),
              fixedSize: MaterialStateProperty.all<Size>(Size(379.w, 51.h)),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CompletePage(),
                ),
              );
            },
            child: Text(
              'FINISH',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
