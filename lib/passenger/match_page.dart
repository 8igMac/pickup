import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pickup/color.dart';
import 'package:pickup/server.dart';
import 'package:provider/provider.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({Key? key}) : super(key: key);

  @override
  State<MatchPage> createState() => MatchPageState();
}

class MatchPageState extends State<MatchPage> {
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
          SizedBox(height: 50.h),
          SizedBox(
            height: 650.h,
            child: ListView.builder(
              padding: EdgeInsets.all(10.w),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    final server = Provider.of<Server>(context, listen: false);
                    await server.chooseDriver();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: SizedBox(
                    width: 400.w,
                    child: const Image(
                      image: AssetImage('assets/images/match_card.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
            // child: ListView(
            //   padding: EdgeInsets.all(10.w),
            //   scrollDirection: Axis.horizontal,
            //   children: [
            //     SizedBox(
            //         width: 400.w,
            //         child: ElevatedButton(
            //           child: Container(
            //               width: 900.w,
            //               height: 650.h,
            //               child: InkWell(
            //                   onTap: () async {
            //                     // await Communication.pickDriver();
            //                     Navigator.of(context).pop();
            //                     Navigator.of(context).pop();
            //                     Navigator.of(context).pop();
            //                   },
            //                   child: const Image(
            //                       image: AssetImage(
            //                           "assets/images/match_card.png"),
            //                       fit: BoxFit.fill))),
            //           style: ElevatedButton.styleFrom(
            //             primary: Colors.white,
            //           ),
            //           onPressed: () {
            //             setState(() {});
            //           },
            //         )),
            //     SizedBox(width: 11.w),
            //     SizedBox(
            //         width: 400.w,
            //         child: ElevatedButton(
            //           child: Container(
            //               width: 900.w,
            //               height: 750.h,
            //               child: InkWell(
            //                   onTap: () {
            //                     Navigator.of(context).pop();
            //                     Navigator.of(context).pop();
            //                     Navigator.of(context).pop();
            //                   },
            //                   child: const Image(
            //                       image: AssetImage(
            //                           "assets/images/match_card.png"),
            //                       fit: BoxFit.fill))),
            //           style: ElevatedButton.styleFrom(
            //             primary: Colors.white,
            //           ),
            //           onPressed: () {
            //             setState(() {});
            //           },
            //         )),
            //     SizedBox(width: 11.w),
            //     SizedBox(
            //         width: 400.w,
            //         child: ElevatedButton(
            //           child: Container(
            //               width: 900.w,
            //               height: 750.h,
            //               child: InkWell(
            //                   onTap: () {
            //                     Navigator.of(context).pop();
            //                     Navigator.of(context).pop();
            //                     Navigator.of(context).pop();
            //                   },
            //                   child: const Image(
            //                       image: AssetImage(
            //                           "assets/images/match_card.png"),
            //                       fit: BoxFit.fill))),
            //           style: ElevatedButton.styleFrom(
            //             primary: Colors.white,
            //           ),
            //           onPressed: () {
            //             setState(() {});
            //           },
            //         )),
            //     SizedBox(width: 11.w),
            //     SizedBox(
            //         width: 400.w,
            //         child: ElevatedButton(
            //           child: Container(
            //               width: 900.w,
            //               height: 750.h,
            //               child: InkWell(
            //                   onTap: () {
            //                     Navigator.of(context).pop();
            //                     Navigator.of(context).pop();
            //                     Navigator.of(context).pop();
            //                   },
            //                   child: const Image(
            //                       image: AssetImage(
            //                           "assets/images/match_card.png"),
            //                       fit: BoxFit.fill))),
            //           style: ElevatedButton.styleFrom(
            //             primary: Colors.white,
            //           ),
            //           onPressed: () {
            //             setState(() {});
            //           },
            //         )),
            //     SizedBox(width: 11.w),
            //   ],
            // ),
          ),
        ],
      ),
    );
  }
}
