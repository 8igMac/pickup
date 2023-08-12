import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickup/rating_page.dart';

import 'color.dart';

class CompletePage extends StatelessWidget {
  const CompletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              MyColors.yellow,
            ],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 143.h),
              CircleAvatar(
                radius: 137.r,
                foregroundImage: AssetImage('assets/images/flag.png'),
              ),
              SizedBox(height: 30.h),
              Container(
                height: 80.h,
                width: 313.w,
                foregroundDecoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/km.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 37.h),
              SizedBox(
                height: 107.h,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('ON TIME SUPERMAN'),
                        Icon(Icons.lock),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 66.h),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(MyColors.red),
                  fixedSize: MaterialStateProperty.all<Size>(Size(157.w, 51.h)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RatingPage(),
                    ),
                  );
                },
                child: Text(
                  'NEXT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
