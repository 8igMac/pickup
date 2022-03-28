import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color.dart';

class MatchPage extends StatelessWidget {
  const MatchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: 428.w,
            height: 746.h,
            foregroundDecoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/match.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 48.h),
          TextButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(MyColors.orange),
              fixedSize: MaterialStateProperty.all<Size>(Size(338.w, 72.h)),
            ),
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Receive',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
