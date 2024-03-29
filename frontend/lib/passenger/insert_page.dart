import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pickup/color.dart';
import 'check_page.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({Key? key}) : super(key: key);

  @override
  State<InsertPage> createState() => InsertPageState();
}

class InsertPageState extends State<InsertPage> {
  TextEditingController departureController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  String date_value = '1';
  String time_value = '1';
  String gift_value = '1';

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
              //     // builder: (context) => const GiftPage(),
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 130.h,
                width: 50.w,
                child: const Image(
                  image: AssetImage('assets/images/fromTo.png'),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                children: [
                  SizedBox(height: 40.h),
                  buildTextField('No. 1, Daxue Rd., East Dist., Tainan City',
                      departureController),
                  SizedBox(height: 35.h),
                  buildTextField('Where to ?', destinationController),
                  SizedBox(height: 40.h),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.date_range,
                size: 30,
              ),
              SizedBox(
                width: 15.w,
              ),
              DropdownButton(
                items: const <DropdownMenuItem<String>>[
                  DropdownMenuItem(
                    child: Text(
                      "3/21 (一)                                         ",
                    ),
                    value: "1",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "3/22 (二)",
                    ),
                    value: "2",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "3/23 (三)",
                    ),
                    value: "3",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "3/24 (四)",
                    ),
                    value: "4",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "3/35 (五)",
                    ),
                    value: "5",
                  ),
                ],
                onChanged: (selectValue) {
                  //選中後的回撥
                  setState(() {
                    print(selectValue.toString());
                    date_value = selectValue.toString();
                  });
                },
                value: date_value, // 設定初始值，要與列表中的value是相同的
                elevation: 10, //設定陰影
                style: const TextStyle(
                    //設定文字框裡面文字的樣式
                    color: Colors.black,
                    fontSize: 15),
                iconSize: 30, //設定三角標icon的大小
                // underline: Container(
                //   height: 1,
                //   color: Colors.blue,
                // ), // 下劃線
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.timelapse,
                size: 30,
              ),
              SizedBox(
                width: 15.w,
              ),
              DropdownButton(
                items: const <DropdownMenuItem<String>>[
                  DropdownMenuItem(
                    child: Text(
                      "09:00                                             ",
                    ),
                    value: "1",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "09:30",
                    ),
                    value: "2",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "10:00",
                    ),
                    value: "3",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "10:30",
                    ),
                    value: "4",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "11:00",
                    ),
                    value: "5",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "11:30",
                    ),
                    value: "6",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "12:00",
                    ),
                    value: "7",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "12:30",
                    ),
                    value: "8",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "13:00",
                    ),
                    value: "9",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "13:30",
                    ),
                    value: "10",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "14:00",
                    ),
                    value: "11",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "14:30",
                    ),
                    value: "12",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "15:00",
                    ),
                    value: "13",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "15:30",
                    ),
                    value: "14",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "16:00",
                    ),
                    value: "15",
                  ),
                ],
                onChanged: (selectValue) {
                  //選中後的回撥
                  setState(() {
                    print(selectValue.toString());
                    time_value = selectValue.toString();
                  });
                },
                value: time_value, // 設定初始值，要與列表中的value是相同的
                elevation: 10, //設定陰影
                style: const TextStyle(
                    //設定文字框裡面文字的樣式
                    color: Colors.black,
                    fontSize: 15),
                iconSize: 30, //設定三角標icon的大小
                // underline: Container(
                //   height: 1,
                //   color: Colors.blue,
                // ), // 下劃線
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.card_giftcard,
                size: 30,
              ),
              SizedBox(
                width: 15.w,
              ),
              DropdownButton(
                items: const <DropdownMenuItem<String>>[
                  DropdownMenuItem(
                    child: Text(
                      "Coffee                                             ",
                    ),
                    value: "1",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Cake",
                    ),
                    value: "2",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Coke",
                    ),
                    value: "3",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Ice cream",
                    ),
                    value: "4",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Ice tea",
                    ),
                    value: "5",
                  ),
                ],
                onChanged: (selectValue) {
                  //選中後的回撥
                  setState(() {
                    print(selectValue.toString());
                    gift_value = selectValue.toString();
                  });
                },
                value: gift_value, // 設定初始值，要與列表中的value是相同的
                elevation: 10, //設定陰影
                style: const TextStyle(
                    //設定文字框裡面文字的樣式
                    color: Colors.black,
                    fontSize: 15),
                iconSize: 30, //設定三角標icon的大小
                // underline: Container(
                //   height: 1,
                //   color: Colors.blue,
                // ), // 下劃線
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.message,
                size: 30,
              ),
              SizedBox(
                width: 15.w,
              ),
              buildTextField('leave a message', messageController),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.only(left: 25.0, right: 20.0),
                    primary: Color.fromARGB(255, 92, 89, 89),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    textStyle: const TextStyle(fontSize: 20),
                    backgroundColor: Colors.yellow),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CheckPage()));
                },
                child: const Text('Next >'),
              ),
              SizedBox(
                width: 40.w,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildTextField(txt, controller) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 50, maxWidth: 270),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true, //重點，必須設定為true，fillColor才有效
          fillColor:
              Color.fromARGB(255, 241, 238, 238), //背景顏色，必須結合filled: true,才有效
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 241, 238, 238), // 設定邊框的顏色
              width: 2.0, // 設定邊框的粗細
            ),
          ),
          // when user choose the TextField
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 219, 219, 219), // 設定邊框的顏色
              width: 2, // 設定邊框的粗細
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          hintText: txt,
        ),
      ),
    );
  }
}
