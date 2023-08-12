import 'package:flutter/material.dart';
import 'package:pickup/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickup/server.dart';
import 'package:provider/provider.dart';

import 'navigation_page.dart';

class PassengerMatchedPage extends StatefulWidget {
  const PassengerMatchedPage({Key? key}) : super(key: key);

  @override
  State<PassengerMatchedPage> createState() => PassengerMatchedPageState();
}

class PassengerMatchedPageState extends State<PassengerMatchedPage> {
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
            width: 500.w,
            height: 710.h,
            child: InkWell(
                onTap: () async {
                  // Notify server.
                  final server = Provider.of<Server>(context, listen: false);
                  await server.driverLocation();

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NavigationPage()));
                },
                child: const Image(
                    image: AssetImage("assets/images/schedule_start.png"),
                    fit: BoxFit.fill))));
  }
}
