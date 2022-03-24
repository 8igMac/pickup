import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home_page.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
