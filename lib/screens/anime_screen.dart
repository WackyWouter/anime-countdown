import 'package:animecountdown/models/anilist_api/anime.dart';
import 'package:animecountdown/models/anilist_api/studio_list.dart';
import 'package:animecountdown/widgets/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animecountdown/models/anime_data.dart';
import 'package:provider/provider.dart';
import 'package:animecountdown/models/color_theme_wizard.dart';
import 'package:animecountdown/widgets/countdown_timer.dart';
import 'package:animecountdown/constant.dart';
import 'package:cache_image/cache_image.dart';

class AnimeScreen extends StatefulWidget {
  static const String id = 'anime_screen';
  final Anime anime;
  AnimeScreen({@required this.anime});

  @override
  _AnimeScreenState createState() => _AnimeScreenState();
}

class _AnimeScreenState extends State<AnimeScreen> {
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
          title: widget.anime.title.romaji.length > 20
              ? widget.anime.title.romaji.substring(0, 16) + "..."
              : widget.anime.title.romaji,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Consumer<ColorThemeWizard>(
                builder: (context, themeWizard, child) {
              return Container(
                color: themeWizard.getCardColor(),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 185,
                            height: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                image: DecorationImage(
                                    image: CacheImage(widget.anime.coverImage),
                                    fit: BoxFit.cover)),
                          ),
                          Expanded(
                            child: Container(
                              height: 300,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 0, 16, 8),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Title',
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: themeWizard
                                                    .getCardTextColor(),
                                                fontSize: 17),
                                          ),
                                          Text(
                                            widget.anime.title.romaji,
                                            style: TextStyle(
                                                color: themeWizard
                                                    .getCardTextColor(),
                                                fontSize: 20),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Studio',
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: themeWizard
                                                    .getCardTextColor(),
                                                fontSize: 17),
                                          ),
                                          Text(
                                            StudioList.studiosStringify(
                                                widget.anime.studios.studio),
                                            style: TextStyle(
                                                color: themeWizard
                                                    .getCardTextColor(),
                                                fontSize: 20),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Score',
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: themeWizard
                                                    .getCardTextColor(),
                                                fontSize: 17),
                                          ),
                                          Text(
                                            widget.anime.averageScore != null
                                                ? widget.anime.averageScore
                                                        .toString() +
                                                    '/100'
                                                : "TBD",
                                            style: TextStyle(
                                                color: themeWizard
                                                    .getCardTextColor(),
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Consumer<AnimeData>(
                                      builder: (context, animeData, child) {
                                        return GestureDetector(
                                          onTap: () {
                                            animeData.favourite(widget.anime);
                                          },
                                          child: FaIcon(
                                            FontAwesomeIcons.solidHeart,
                                            size: 40,
                                            color: widget.anime.favourite
                                                ? themeWizard.getPrimaryColor()
                                                : themeWizard.getIconColor(),
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Divider(
                        height: 40.0,
                        thickness: 2.0,
                        color: kGreyAccent,
                        indent: 8,
                        endIndent: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Status',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: themeWizard.getCardTextColor(),
                                      fontSize: 17),
                                ),
                                Text(
                                  widget.anime.status ?? "TBD",
                                  style: TextStyle(
                                      color: themeWizard.getCardTextColor(),
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'End date',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: themeWizard.getCardTextColor(),
                                      fontSize: 17),
                                ),
                                Text(
                                  widget.anime.endDate.length > 0
                                      ? widget.anime.endDate
                                      : "TBD",
                                  style: TextStyle(
                                      color: themeWizard.getCardTextColor(),
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Start date',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: themeWizard.getCardTextColor(),
                                      fontSize: 17),
                                ),
                                Text(
                                  widget.anime.startDate.length > 0
                                      ? widget.anime.startDate
                                      : "TBD",
                                  style: TextStyle(
                                      color: themeWizard.getCardTextColor(),
                                      fontSize: 20),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(
                        height: 40.0,
                        thickness: 2.0,
                        color: kGreyAccent,
                        indent: 8,
                        endIndent: 8,
                      ),
                      widget.anime.status == "RELEASING"
                          ? Container(
                              alignment: Alignment.center,
                              child: CountdownTimer(
                                secondsRemaining:
                                    widget.anime.nextAiringEpisode != null
                                        ? widget.anime.nextAiringEpisode
                                            .timeUntilAiring
                                        : 0,
                                whenTimeExpires: () {
//                                todo get timer for next episode
                                },
                                countDownTimerStyle: TextStyle(
                                    color: themeWizard.getPrimaryColor(),
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : SizedBox(),
                      widget.anime.status == "RELEASING"
                          ? SizedBox(height: 20)
                          : SizedBox(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: themeWizard.getCardTextColor(),
                                  fontSize: 17),
                            ),
                            Text(
                              widget.anime.description ??
                                  "Description has yet to be added for this title.",
                              style: TextStyle(
                                  color: themeWizard.getCardTextColor(),
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        )
      ]),
    );
  }
}
