import 'package:animecountdown/widgets/fav_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animecountdown/models/color_theme_wizard.dart';
import 'package:animecountdown/widgets/title_bar.dart';

class FavouritesScreen extends StatelessWidget {
  static const String id = 'favourites_screen';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TitleBar(
          title: 'FAVOURITE ANIME',
        ),
        Expanded(child:
            Consumer<ColorThemeWizard>(builder: (context, themeWizard, child) {
          return Container(
            color: themeWizard.getBackgroundColor(),
            child: FavCardList(),
          );
        }))
      ],
    );
  }
}
