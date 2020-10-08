import 'package:flutter/material.dart';
import 'package:animecountdown/screens/login_screen.dart';

void main() {
  runApp(AnimeCountdown());
}

class AnimeCountdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime Countdown',
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
      },
    );
  }
}
