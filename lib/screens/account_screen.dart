import 'package:animecountdown/models/anime_data.dart';
import 'package:animecountdown/screens/change_username_screen.dart';
import 'package:animecountdown/screens/navigator_screen.dart';
import 'package:animecountdown/widgets/settings_card.dart';
import 'package:animecountdown/widgets/settings_row.dart';
import 'package:animecountdown/widgets/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animecountdown/models/color_theme_wizard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animecountdown/screens/change_password_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class AccountScreen extends StatelessWidget {
  static const String id = 'account_screen';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TitleBar(title: 'ACCOUNT'),
        Expanded(
          child: Consumer<ColorThemeWizard>(
              builder: (context, themeWizard, child) {
            return Container(
              color: themeWizard.getBackgroundColor(),
              child: Column(
                children: <Widget>[
                  SettingsCard(
                    height: 180,
                    heading: "Account",
                    widget1: GestureDetector(
                      onTap: () {
                        pushNewScreen(
                          context,
                          screen: ChangeUsernameScreen(),
                          withNavBar: true, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                      child: SettingsRow(
                        icon: FontAwesomeIcons.user,
                        text: 'Change Username',
                        button: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            FontAwesomeIcons.chevronRight,
                            color: themeWizard.getPrimaryColor(),
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    widget2: GestureDetector(
                      onTap: () {
                        pushNewScreenWithRouteSettings(
                          context,
                          screen: ChangePasswordScreen(),
                          withNavBar: true,
                          settings: RouteSettings(
                              name: NavigatorScreen
                                  .id), // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                      child: SettingsRow(
                        icon: FontAwesomeIcons.lock,
                        text: 'Change Password',
                        button: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            FontAwesomeIcons.chevronRight,
                            color: themeWizard.getPrimaryColor(),
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SettingsCard(
                      height: 120,
                      heading: "Statistics",
                      widget1: Consumer<AnimeData>(
                        builder: (context, animeData, child) {
                          return SettingsRow(
                            icon: FontAwesomeIcons.hashtag,
                            text: 'Anime Favourited',
                            endText: Text(
                              animeData.favIdCount.toString(),
                              style: TextStyle(
                                  color: themeWizard.getCardTextColor(),
                                  fontSize: 20.0),
                            ),
                          );
                        },
                      )),
                ],
              ),
            );
          }),
        )
      ],
    );
  }
}
