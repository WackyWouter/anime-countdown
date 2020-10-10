import 'package:flutter/material.dart';

class LoginMode extends StatelessWidget {
  final Alignment align;
  final String text;
  final Color color;
  final Function onTap;

  LoginMode(
      {@required this.text,
      @required this.color,
      @required this.align,
      @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100.0,
        alignment: align,
        child: Text(
          text,
          style: TextStyle(color: color, fontSize: 20.0),
        ),
      ),
    );
  }
}
