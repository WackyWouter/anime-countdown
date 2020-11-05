import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({
    Key key,
    int secondsRemaining,
    this.countDownTimerStyle,
    this.whenTimeExpires,
    this.countDownFormatter,
  })  : secondsRemaining = secondsRemaining,
        super(key: key);

  final int secondsRemaining;
  final Function whenTimeExpires;
  final Function countDownFormatter;
  final TextStyle countDownTimerStyle;

  State createState() => new _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Duration duration;

  String get timerDisplayString {
    Duration duration = _controller.duration * _controller.value;
    return widget.countDownFormatter != null
        ? widget.countDownFormatter(duration.inSeconds)
        : formatDDHHMMSS(duration.inSeconds);
    // In case user doesn't provide formatter use the default one
    // for that create a method which will be called formatHHMMSS or whatever you like
  }

  @override
  void initState() {
    super.initState();
    duration = new Duration(seconds: widget.secondsRemaining);
    _controller = new AnimationController(
      vsync: this,
      duration: duration,
    );
    _controller.reverse(from: widget.secondsRemaining.toDouble());
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        widget.whenTimeExpires();
      }
    });
  }

  @override
  // ignore: must_call_super
  void didUpdateWidget(CountdownTimer oldWidget) {
    if (widget.secondsRemaining != oldWidget.secondsRemaining) {
      setState(() {
        duration = new Duration(seconds: widget.secondsRemaining);
        _controller.dispose();
        _controller = new AnimationController(
          vsync: this,
          duration: duration,
        );
        _controller.reverse(from: widget.secondsRemaining.toDouble());
        _controller.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            widget.whenTimeExpires();
          } else if (status == AnimationStatus.dismissed) {
            print("Animation Complete");
          }
        });
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: AnimatedBuilder(
            animation: _controller,
            builder: (_, Widget child) {
              return Text(
                timerDisplayString,
                textAlign: TextAlign.center,
                style: widget.countDownTimerStyle,
              );
            }));
  }

  String formatDDHHMMSS(int seconds) {
    int days = (seconds / 86400).truncate();
    int secLeft = (seconds % 86400).truncate();
    int hours = (secLeft / 3600).truncate();
    secLeft = (secLeft % 3600).truncate();
    int minutes = (secLeft / 60).truncate();
    seconds = (secLeft % 60).truncate();

    return "days: ${days.toString()}, hours: ${hours.toString()}, min: ${minutes.toString()}, sec: ${seconds.toString()}";
  }
}
