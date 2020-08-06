import 'package:flutter/material.dart';

class ReusableIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  ReusableIcon({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 88.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 18, color: Color(0xffA9AABA)),
        ),
      ],
    );
  }
}
