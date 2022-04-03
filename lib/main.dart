import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickup/color.dart';
import 'package:pickup/friend_page.dart';
import 'package:pickup/match_page.dart';
import 'package:pickup/passenger/finish_page.dart';
import 'package:pickup/passenger/home_page.dart';
import 'package:pickup/schedule_page.dart';
import 'package:pickup/schedule_start_page.dart';
import 'package:pickup/server.dart';
import 'package:provider/provider.dart';

import 'driver_home_page.dart';
import 'gift_page.dart';
import 'passenger/driver_info_page.dart';
import 'passenger/driver_start_page.dart';
import 'noti.dart';

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
        return ChangeNotifierProvider<Server>(
          create: (context) => Server(),
          child: MaterialApp(
            home: const MainPage(),
          ),
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

  var _notifications = <Noti>[
    // Noti(
    //   type: NotiType.gift,
    //   content: 'You got a gift from Annie.',
    // ),
    // Noti(
    //   type: NotiType.newFriend,
    //   content: "Anny want's to be friend with you.",
    // ),
    // Noti(
    //   type: NotiType.driverMatched,
    //   content: 'We got you a driver.',
    // ),
    // Noti(
    //   type: NotiType.passengerMatched,
    //   content: 'We got you a passenger',
    // ),
    // Noti(
    //   type: NotiType.driverStarted,
    //   content: 'Your driver had started.',
    // ),
  ];
  late StreamSubscription<Noti> _subscription;

  @override
  void initState() {
    final server = Provider.of<Server>(context, listen: false);
    _subscription = server.notifications.listen(
      (notification) async {
        if (notification.type == NotiType.driverFinishd) {
          _pageNavigatorKey.currentState!.push(
            MaterialPageRoute(
              builder: (context) => PassengerFinishPage(),
            ),
          );
        } else {
          setState(() {
            _notifications.add(notification);
          });
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

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
                  PopupMenuButton<Noti>(
                    offset: const Offset(0, 50),
                    icon: const Icon(
                      Icons.notifications,
                      color: Color.fromARGB(255, 131, 128, 128),
                    ),
                    onSelected: (notification) {
                      // Remove the notification one opened.
                      _notifications.remove(notification);

                      // Action to take when tapped on the notification.
                      switch (notification.type) {
                        case NotiType.driverMatched:
                          _pageNavigatorKey.currentState!
                              .pushNamed('/driver_matched');
                          break;
                        case NotiType.driverStarted:
                          _pageNavigatorKey.currentState!
                              .pushNamed('/driver_started');
                          break;
                        case NotiType.passengerMatched:
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => PassengerMatchPage(),
                          //   ),
                          // );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return PassengerMatchedPage();
                              },
                            ),
                          );
                          setState(() {
                            _selectedIndex = 1;
                          });
                          break;
                        case NotiType.newFriend:
                          _pageNavigatorKey.currentState!
                              .pushNamed('/new_friend');
                          break;
                        case NotiType.gift:
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
                      const notiIcon = {
                        NotiType.gift: Icons.card_giftcard,
                        NotiType.newFriend: Icons.people,
                        NotiType.driverStarted: Icons.location_on,
                        NotiType.driverMatched: Icons.local_taxi,
                        NotiType.passengerMatched: Icons.emoji_people,
                      };

                      return _notifications.map(
                        (noti) {
                          return PopupMenuItem<Noti>(
                            value: noti,
                            child: ListTile(
                              visualDensity: VisualDensity.compact,
                              contentPadding: EdgeInsets.zero,
                              leading: Icon(notiIcon[noti.type]),
                              title: Text(noti.content),
                            ),
                          );
                        },
                      ).toList();
                    },
                  )
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
