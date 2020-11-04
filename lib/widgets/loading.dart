import 'package:flutter/material.dart';
import 'package:animecountdown/constant.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Loading extends StatelessWidget {
  final Widget child;
  final bool inProgress;
  final Color iconColor;

  Loading({@required this.child, @required this.inProgress, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        progressIndicator: Container(
          height: 100,
          width: 100,
          child: LoadingIndicator(
            indicatorType: Indicator.pacman,
            color: iconColor ?? Colors.blueAccent,
          ),
        ),
        inAsyncCall: inProgress,
        color: kLoadingBackground,
        child: child);
  }
}
