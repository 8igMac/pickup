import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color.dart';

class GiftPage extends StatefulWidget {
  const GiftPage({Key? key}) : super(key: key);

  @override
  State<GiftPage> createState() => _GiftPageState();
}

class _GiftPageState extends State<GiftPage> {
  var _giftIsOpened = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _giftIsOpened = true;
              });
            },
            child: Container(
              width: 428.w,
              height: 740.h,
              foregroundDecoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_giftIsOpened
                      ? 'assets/images/gift_opened.png'
                      : 'assets/images/gift_unopened.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(height: 30.h),
          TextButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(MyColors.orange),
              fixedSize: MaterialStateProperty.all<Size>(Size(338.w, 72.h)),
            ),
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Back',
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
