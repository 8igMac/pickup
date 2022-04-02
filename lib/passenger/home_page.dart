import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../gift_page.dart';
import 'insert_page.dart';

class PassengerHomePage extends StatelessWidget {
  const PassengerHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const Image(
            image: AssetImage('assets/images/passenger.png'),
            fit: BoxFit.fill,
          ),
          Container(
              width: 424.w,
              height: 70.h,
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InsertPage()));
                  },
                  child: const Image(
                      image: AssetImage("assets/images/whereToGo.png"),
                      fit: BoxFit.fill))),
          SizedBox(
            height: 400.h,
            width: 428.w,
            child: const Image(
              image: AssetImage('assets/images/history_map.png'),
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
