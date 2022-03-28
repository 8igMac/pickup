import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'match_page.dart';
import 'navigation_page.dart';

class DriverSchedulePage extends StatelessWidget {
  const DriverSchedulePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   foregroundDecoration: BoxDecoration(
    //     image: DecorationImage(
    //       image: AssetImage('assets/images/schedule_page.png'),
    //       fit: BoxFit.fill,
    //     ),
    //   ),
    // );
    return Padding(
      padding: EdgeInsets.only(
        left: 33.w,
        right: 33.w,
        top: 46.h,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NavigationPage(),
                ),
              );
            },
            child: Container(
              width: 363.w,
              height: 481.h,
              foregroundDecoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/middle_schedule.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(height: 67.h),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MatchPage(),
                ),
              );
            },
            child: Container(
              width: 120.w,
              height: 72.h,
              foregroundDecoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/envelope.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PassengerSchedulePage extends StatefulWidget {
  const PassengerSchedulePage({Key? key}) : super(key: key);

  @override
  State<PassengerSchedulePage> createState() => SchedulePageState();
}

class SchedulePageState extends State<PassengerSchedulePage> {
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

class InsertPage extends StatefulWidget {
  const InsertPage({Key? key}) : super(key: key);

  @override
  State<InsertPage> createState() => InsertPageState();
}

class InsertPageState extends State<InsertPage> {
  TextEditingController departureController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  String value = '3';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 30.h),
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
                Icons.timelapse,
                size: 30,
              ),
              SizedBox(
                width: 15.w,
              ),
              buildDropdown(value),
            ],
          ),
          SizedBox(height: 40.h),
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
                      "星期一",
                    ),
                    value: "1",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "星期二",
                    ),
                    value: "2",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "星期三",
                    ),
                    value: "3",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "星期四",
                    ),
                    value: "4",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "星期五",
                    ),
                    value: "5",
                  ),
                ],
                onChanged: (selectValue) {
                  //選中後的回撥
                  setState(() {
                    print(selectValue.toString());
                    value = selectValue.toString();
                    print(value);
                  });
                },
                value: value, // 設定初始值，要與列表中的value是相同的
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
          SizedBox(height: 40.h),
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
          SizedBox(height: 180.h),
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
      constraints: const BoxConstraints(maxHeight: 50, maxWidth: 280),
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

  Widget buildDropdown(String value) {
    return DropdownButton(
      items: const <DropdownMenuItem<String>>[
        DropdownMenuItem(
          child: Text(
            "星期一",
          ),
          value: "1",
        ),
        DropdownMenuItem(
          child: Text(
            "星期二",
          ),
          value: "2",
        ),
        DropdownMenuItem(
          child: Text(
            "星期三",
          ),
          value: "3",
        ),
        DropdownMenuItem(
          child: Text(
            "星期四",
          ),
          value: "4",
        ),
        DropdownMenuItem(
          child: Text(
            "星期五",
          ),
          value: "5",
        ),
      ],
      onChanged: (selectValue) {
        //選中後的回撥
        setState(() {
          print(selectValue.toString());
          value = selectValue.toString();
          print(value);
        });
      },
      value: value, // 設定初始值，要與列表中的value是相同的
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
    );
  }
}

class CheckPage extends StatefulWidget {
  const CheckPage({Key? key}) : super(key: key);

  @override
  State<CheckPage> createState() => CheckPageState();
}

class CheckPageState extends State<CheckPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 844.h,
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
                            builder: (context) => const InsertPage()));
                  },
                  child: const Image(
                      image: AssetImage("assets/images/check.png"),
                      fit: BoxFit.fill))),
        ],
      ),
    );
  }
}
