import 'package:flutter/material.dart';

class AvatarCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        child: Image.asset('assets/images/pokeball8bit.png'),
        width: 50,
        height: 50,
      ),
    );
  }
}