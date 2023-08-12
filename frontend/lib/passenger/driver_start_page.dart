import 'package:flutter/material.dart';
import 'package:pickup/color.dart';

import 'start_page.dart';

class DriverStartPage extends StatefulWidget {
  const DriverStartPage({Key? key}) : super(key: key);

  @override
  State<DriverStartPage> createState() => DriverStartPageState();
}

class DriverStartPageState extends State<DriverStartPage> {
  void initState() {
    super.initState();
    jumpPage();
  }

  void jumpPage() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const StartPage()));
    });
  }

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
              Navigator.of(context).pop();
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
        foregroundDecoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/driver_start.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
