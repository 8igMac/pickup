import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../gift_page.dart';
import 'package:pickup/color.dart';
import '../star.dart';

class PassengerFinishPage extends StatefulWidget {
  const PassengerFinishPage({Key? key}) : super(key: key);

  @override
  State<PassengerFinishPage> createState() => PassengerFinishPageState();
}

class PassengerFinishPageState extends State<PassengerFinishPage> {
  @override
  Widget build(BuildContext context) {
    String ratingValue;
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GiftPage(),
                ),
              );
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
              height: 160.h,
              width: 424.w,
              child: ElevatedButton(
                child: Container(
                    child: InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             const PassengerHomePage()));
                          Navigator.pop(context);
                        },
                        child: const Image(
                            image: AssetImage("assets/images/yellow_box.png"),
                            fit: BoxFit.fill))),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 255, 255, 255),
                    shadowColor: Colors.white),
                onPressed: () {
                  setState(() {});
                },
              )),
          SizedBox(
            height: 5.h,
          ),
          Container(
            width: 390.w,
            height: 530.h,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 216, 212, 212),
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30.w,
                    ),
                    Text("給對方好評"),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                const Text('______________________________________'),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 35.w,
                    ),
                    RatingBar(
                      value: 0,
                      size: 50,
                      padding: 10,
                      nomalImage: 'assets/images/star_nomal.png',
                      selectImage: 'assets/images/star.png',
                      selectAble: true,
                      onRatingUpdate: (value) {
                        ratingValue = value;
                        setState(() {});
                      },
                      maxRating: 10,
                      count: 5,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: 350.w,
                  height: 330.h,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  child: ConstrainedBox(
                    constraints:
                        const BoxConstraints(maxHeight: 300, maxWidth: 20),
                    child: const TextField(
                      decoration: InputDecoration(
                        filled: true, //重點，必須設定為true，fillColor才有效
                        fillColor: Color.fromARGB(
                            255, 255, 255, 255), //背景顏色，必須結合filled: true,才有效
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                            color:
                                Color.fromARGB(255, 255, 255, 255), // 設定邊框的顏色
                            width: 0, // 設定邊框的粗細
                          ),
                        ),
                        // when user choose the TextField
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                Color.fromARGB(255, 255, 255, 255), // 設定邊框的顏色
                            width: 0, // 設定邊框的粗細
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        hintText: "留言給對方....",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
