import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickup/color.dart';
import 'package:pickup/friend_page.dart';
import 'package:pickup/match_page.dart';
import 'package:pickup/passenger/home_page.dart';
import 'package:pickup/schedule_page.dart';

import 'driver_home_page.dart';
import 'gift_page.dart';
import 'passenger/driver_info_page.dart';
import 'passenger/driver_start_page.dart';

GlobalKey<NavigatorState> _pageNavigatorKey = GlobalKey<NavigatorState>();

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
      body: Navigator(
        key: _pageNavigatorKey,
        onGenerateRoute: (settings) {
          print('Current route: ${settings.name}'); //debug
          if (settings.name == '/driver_matched') {
            return MaterialPageRoute(
              builder: (context) => const Scaffold(
                // appBar: AppBar(),
                // body: Center(
                //   child: Text('Driver matched'),
                body: DriverInfoPage(),
              ),
            );
          } else if (settings.name == '/driver_started') {
            return MaterialPageRoute(
              builder: (context) => const Scaffold(
                  // appBar: AppBar(),
                  // body: Center(
                  //   child: Text('Driver started'),
                  // ),
                  body: DriverStartPage()),
            );
          } else if (settings.name == '/driver_started') {
            return MaterialPageRoute(
              builder: (context) => const Scaffold(
                  // appBar: AppBar(),
                  // body: Center(
                  //   child: Text('Driver started'),
                  // ),
                  body: DriverStartPage()),
            );
          } else if (settings.name == '/new_friend') {
            return MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(),
                body: Center(
                  child: Text('New Friend'),
                ),
              ),
            );
          }

          return MaterialPageRoute(
            builder: (context) => Scaffold(
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
                                Icon(_isDriver
                                    ? Icons.local_taxi
                                    : Icons.emoji_people),
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 23.w, vertical: 14.h),
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
                title: const Text(
                  'Pick Up',
                  style: TextStyle(
                    color: Color.fromARGB(255, 90, 89, 89),
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: MyColors.grey,
                actions: [
                  PopupMenuButton(
                    offset: const Offset(0, 50),
                    icon: const Icon(
                      Icons.notifications,
                      color: Color.fromARGB(255, 131, 128, 128),
                    ),
                    onSelected: (value) {
                      switch (value) {
                        case 'driver matched':
                          _pageNavigatorKey.currentState!
                              .pushNamed('/driver_matched');
                          break;
                        case 'driver started':
                          _pageNavigatorKey.currentState!
                              .pushNamed('/driver_started');
                          break;
                        case 'passenger matched':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PassengerMatchPage(),
                            ),
                          );
                          break;
                        case 'new friend':
                          _pageNavigatorKey.currentState!
                              .pushNamed('/new_friend');
                          break;
                        case 'gift':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GiftPage(),
                            ),
                          );
                          break;
                        default:
                          print('Unknown notification type.');
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      final choices = <String>[
                        'driver matched',
                        'driver started',
                        'passenger matched',
                        'new friend',
                        'gift'
                      ];
                      return choices.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    },
                  ),
                ],
              ),
              body: _isDriver
                  ? _driverPages.elementAt(_selectedIndex)
                  : _passengerPages.elementAt(_selectedIndex),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule_sharp),
            label: 'schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'chat',
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
