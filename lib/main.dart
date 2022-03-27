import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickup/color.dart';
import 'package:pickup/friend_page.dart';
import 'package:pickup/passenger_home_page.dart';
import 'package:pickup/schedule_page.dart';

import 'driver_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: () {
        return MaterialApp(
          home: const MainPage(),
        );
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  bool _isDriver = true;

  final _driverPages = <Widget>[
    DriverHomePage(),
    DriverSchedulePage(),
    FriendPage(),
  ];

  final _passengerPages = <Widget>[
    PassengerHomePage(),
    PassengerSchedulePage(),
    FriendPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 150.h,
              child: DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Jing Ting Lin',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 9.w,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(_isDriver ? Icons.local_taxi : Icons.emoji_people),
                        CupertinoSwitch(
                          value: _isDriver,
                          onChanged: (value) {
                            setState(() {
                              _isDriver = value;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 14.h),
              ),
            ),
            ListTile(
              title: Text('1'),
              onTap: null,
            ),
            ListTile(
              title: Text('1'),
              onTap: null,
            ),
            ListTile(
              title: Text('1'),
              onTap: null,
            ),
            ListTile(
              title: Text('1'),
              onTap: null,
            ),
            ListTile(
              title: Text('1'),
              onTap: null,
            ),
            ListTile(
              title: Text('1'),
              onTap: null,
            ),
            Spacer(),
            ListTile(
              title: Text('last'),
              onTap: null,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: MyColors.grey,
        actions: [
          IconButton(
            onPressed: null,
            iconSize: 30,
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: _isDriver
          ? _driverPages.elementAt(_selectedIndex)
          : _passengerPages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'school',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'business',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
