import 'package:flutter/material.dart';

class ThinOutlineBtn extends StatelessWidget {
  final Color primaryColor;
  final Color darkColor;
  final String text;
  final Function ontap;

  const ThinOutlineBtn(
      {@required this.primaryColor,
      @required this.darkColor,
      @required this.text,
      @required this.ontap});

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: ontap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          text,
          style: TextStyle(color: primaryColor, fontSize: 20),
        ),
      ),
      borderSide: BorderSide(color: primaryColor, width: 2),
      highlightedBorderColor: darkColor,
      highlightColor: darkColor,
    );
  }
}
