import 'package:animecountdown/widgets/card_list.dart';
import 'package:animecountdown/widgets/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:animecountdown/models/color_theme_wizard.dart';

class TrendingAnimeScreen extends StatelessWidget {
  static const String id = 'trending_anime_screen';
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorThemeWizard>(builder: (context, themeWizard, child) {
      return Column(
        children: <Widget>[
          TitleBar(
            widgetLeft: GestureDetector(
              onTap: () {
//                TODO open filter menu
              },
              child: FaIcon(
                FontAwesomeIcons.filter,
                size: 25,
                color: themeWizard.getCardTextColor(),
              ),
            ),
            title: "TRENDING",
            widgetRight: GestureDetector(
              onTap: () {
//                TODO open search menu
              },
              child: FaIcon(
                FontAwesomeIcons.search,
                size: 25,
                color: themeWizard.getCardTextColor(),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: themeWizard.getBackgroundColor(),
              child: CardList(
                fav: false,
                type: "trending",
              ),
            ),
          ),
        ],
      );
    });
  }
}
