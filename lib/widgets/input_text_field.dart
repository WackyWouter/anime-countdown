import 'package:flutter/material.dart';
import 'package:animecountdown/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputTextField extends StatelessWidget {
  final bool obscureText;
  final IconData icon;
  final Color primaryColor;
  final String hintText;
  final Color loginBoxColor;
  final Color textColor;
  final Function onChange;

  InputTextField(
      {@required this.obscureText,
      @required this.icon,
      @required this.primaryColor,
      @required this.hintText,
      @required this.loginBoxColor,
      this.onChange,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      textAlign: TextAlign.left,
      onChanged: onChange ?? (value) {},
      style: TextStyle(
          color: textColor ?? Colors.white, fontSize: 20, height: 1.5),
      decoration: kTextFieldDecoration.copyWith(
        hintText: hintText,
        fillColor: loginBoxColor,
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
            width: 6.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
            width: 6.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 25, 15),
          child: FaIcon(
            icon,
            size: 27.0,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
