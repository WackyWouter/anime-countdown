import 'package:flutter/material.dart';

class ColorDialogButton extends StatelessWidget {
  final Color btnColor;
  final Function onPressed;
  final String text;

  ColorDialogButton(
      {@required this.text, @required this.onPressed, @required this.btnColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: FlatButton(
        color: btnColor,
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
