import 'package:animecountdown/graphql_test.dart';
import 'package:animecountdown/models/color_theme_wizard.dart';
import 'package:animecountdown/screens/account_screen.dart';
import 'package:animecountdown/screens/change_password_screen.dart';
import 'package:animecountdown/screens/favourites_screen.dart';
import 'package:animecountdown/screens/navigator_screen.dart';
import 'package:animecountdown/screens/settings_screen.dart';
import 'package:animecountdown/screens/trending_anime_screen.dart';
import 'package:flutter/material.dart';
import 'package:animecountdown/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:animecountdown/anilist_api.dart' as AnilistApi;

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ColorThemeWizard(),
    child: AnimeCountdown(),
  ));
}

class AnimeCountdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime Countdown',
      initialRoute: LoginScreen.id,
      routes: {
        GraphqlTest.id: (context) => GraphqlTest(),
        NavigatorScreen.id: (context) => NavigatorScreen(),
        ChangePasswordScreen.id: (context) => ChangePasswordScreen(),
        AccountScreen.id: (context) => AccountScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        FavouritesScreen.id: (context) => FavouritesScreen(),
        TrendingAnimeScreen.id: (context) => TrendingAnimeScreen(),
        SettingsScreen.id: (context) => SettingsScreen(),
      },
    );
  }
}
