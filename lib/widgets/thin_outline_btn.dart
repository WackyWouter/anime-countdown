import 'package:flutter/material.dart';

class ThinOutlineBtn extends StatelessWidget {
  final Color primaryColor;
  final Color darkColor;
  final Color highlightedBorderColor;
  final String text;
  final Function ontap;
  final double width;
  final double padding;

  const ThinOutlineBtn(
      {@required this.primaryColor,
      @required this.darkColor,
      @required this.text,
      @required this.ontap,
      this.width,
      this.padding,
      this.highlightedBorderColor});

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: ontap,
      child: Padding(
        padding: EdgeInsets.all(padding ?? 4.0),
        child: Text(
          text,
          style: TextStyle(color: primaryColor, fontSize: 20),
        ),
      ),
      borderSide: BorderSide(color: primaryColor, width: width ?? 2),
      highlightedBorderColor: highlightedBorderColor ?? darkColor,
      highlightColor: darkColor,
    );
  }
}
