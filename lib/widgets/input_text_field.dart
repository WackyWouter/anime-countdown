import 'package:flutter/material.dart';
import 'package:animecountdown/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputTextField extends StatelessWidget {
  final bool obscureText;
  final Function onChanged;
  final IconData icon;
  final Color iconColor;
  final String hintText;

  InputTextField(
      {@required this.obscureText,
      @required this.onChanged,
      @required this.icon,
      @required this.iconColor,
      @required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      textAlign: TextAlign.left,
      onChanged: (value) {},
      style: kTextStyleTextField,
      decoration: kTextFieldDecoration.copyWith(
        hintText: hintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 25, 15),
          child: FaIcon(
            icon,
            size: 27.0,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
