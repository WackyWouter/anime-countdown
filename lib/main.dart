import 'package:animecountdown/screens/anime_screen.dart';
import 'package:animecountdown/screens/favourites_screen.dart';
import 'package:animecountdown/screens/settings_screen.dart';
import 'package:animecountdown/screens/trending_anime_screen.dart';
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
      initialRoute: SettingsScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        AnimeScreen.id: (context) => AnimeScreen(),
        FavouritesScreen.id: (context) => FavouritesScreen(),
        TrendingAnimeScreen.id: (context) => TrendingAnimeScreen(),
        SettingsScreen.id: (context) => SettingsScreen(),
      },
    );
  }
}
