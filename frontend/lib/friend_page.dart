import 'package:flutter/material.dart';

class FriendPage extends StatelessWidget {
  const FriendPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/friend_page.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
