import 'package:flutter/material.dart';

class PassengerHomePage extends StatelessWidget {
  const PassengerHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/passenger_home_page.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}