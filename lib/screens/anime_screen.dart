import 'package:animecountdown/models/anime.dart';
import 'package:animecountdown/widgets/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animecountdown/models/anime_data.dart';
import 'package:provider/provider.dart';
import 'package:animecountdown/models/color_theme_wizard.dart';

class AnimeScreen extends StatefulWidget {
  static const String id = 'anime_screen';
  final Anime anime;
  AnimeScreen({@required this.anime});

  @override
  _AnimeScreenState createState() => _AnimeScreenState();
}

class _AnimeScreenState extends State<AnimeScreen> {
  AnimeData animeData = AnimeData();
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(children: <Widget>[
        TitleBar(
          widgetLeft: GestureDetector(
            onTap: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: FaIcon(
              FontAwesomeIcons.arrowLeft,
              size: 30,
              color: Colors.white,
            ),
          ),
          title: widget.anime.title,
        ),
        Expanded(
          child: Consumer<ColorThemeWizard>(
              builder: (context, themeWizard, child) {
            return Container(
              color: themeWizard.getBackgroundColor(),
              child: Column(),
            );
          }),
        )
      ]),
    );
  }
}
