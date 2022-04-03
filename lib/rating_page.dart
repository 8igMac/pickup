import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickup/server.dart';
import 'package:provider/provider.dart';

import 'color.dart';

class RatingPage extends StatelessWidget {
  const RatingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 20.h),
          Container(
            width: 389.w,
            height: 143.h,
            foregroundDecoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/yellow_box.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            width: 322.w,
            height: 334.h,
            foregroundDecoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/girl.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 43.w,
              right: 43.w,
              top: 20.h,
              bottom: 20.h,
            ),
            width: 389.w,
            decoration: BoxDecoration(
              color: MyColors.grey,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Column(
              children: [
                Text(
                  'Give Stars to Annie',
                  style: TextStyle(
                    fontSize: 24.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'TIP: When the star are more then 8, both of you will be friend.',
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.star, size: 40.w, color: Colors.white),
                    Icon(Icons.star, size: 40.w, color: Colors.white),
                    Icon(Icons.star, size: 40.w, color: Colors.white),
                    Icon(Icons.star, size: 40.w, color: Colors.white),
                    Icon(Icons.star, size: 40.w, color: Colors.white),
                  ],
                ),
              ],
            ),
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(MyColors.red),
              fixedSize: MaterialStateProperty.all<Size>(Size(157.w, 51.h)),
            ),
            onPressed: () async {
              // TODO: Driver rate.
              final server = Provider.of<Server>(context, listen: false);
              await server.driverRate(5);

              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text(
              'SENT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
