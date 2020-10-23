import 'package:flutter/material.dart';
import 'package:animecountdown/models/color_theme_wizard.dart';

const Color kGreyAccent = Color(0xFF868686);
const Color kNavbarBackground = Color(0xFF32353A);
const Color kInActiveHeart = Color(0xFFA3A3A3);

const String kUrl = 'http://wfcbosch-nl.stackstaging.com/anime/index.php/';
const String kAppUuid = '2f3f459f-7d9f-49a9-8ff0-59b8c189e1ab';

// If color doesn't change properly put this in with the textfield file
final kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  filled: true,
  contentPadding: EdgeInsets.fromLTRB(0, 17, 0, 5),
  hintStyle: TextStyle(color: kGreyAccent, fontSize: 20, height: 1.5),
  fillColor: ColorThemeWizard().getLoginBoxColor(),
  border: UnderlineInputBorder(
    borderSide: BorderSide(
      color: ColorThemeWizard().getPrimaryColor(),
      width: 6.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: ColorThemeWizard().getPrimaryColor(),
      width: 6.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
        BorderSide(color: ColorThemeWizard().getPrimaryColor(), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);
