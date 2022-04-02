import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickup/color.dart';

class DriverInfoPage extends StatefulWidget {
  const DriverInfoPage({Key? key}) : super(key: key);

  @override
  State<DriverInfoPage> createState() => DriverInfoPageState();
}

class DriverInfoPageState extends State<DriverInfoPage> {
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
              Navigator.pop(context);
            },
            iconSize: 30,
            icon: const Icon(
              Icons.close,
              color: Color.fromARGB(255, 131, 128, 128),
            ),
          ),
        ],
      ),
      body: Container(
        width: 500.w,
        height: 700.h,
        child: const Image(
          image: AssetImage('assets/images/driver_info.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
