import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pickup/color.dart';
import 'match_page.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({Key? key}) : super(key: key);

  @override
  State<CheckPage> createState() => CheckPageState();
}

class CheckPageState extends State<CheckPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.grey,
        title: const Text(
          'Pick Up',
          style: TextStyle(
            color: Color.fromARGB(255, 90, 89, 89),
            fontSize: 30,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const GiftPage(),
              //   ),
              // );
            },
            iconSize: 30,
            icon: const Icon(
              Icons.notifications,
              color: Color.fromARGB(255, 131, 128, 128),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: 500.w,
            height: 630.h,
            child: const Image(
              image: AssetImage('assets/images/checkPage.png'),
              fit: BoxFit.fill,
            ),
          ),
          Container(
              width: 410.w,
              height: 80.h,
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MatchPage()));
                  },
                  child: const Image(
                      image: AssetImage("assets/images/check.png"),
                      fit: BoxFit.fill))),
        ],
      ),
    );
  }
}
