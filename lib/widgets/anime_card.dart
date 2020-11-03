import 'package:animecountdown/models/anilist_api/studio_list.dart';
import 'package:animecountdown/models/anime_data.dart';
import 'package:animecountdown/screens/anime_screen.dart';
import 'package:animecountdown/widgets/countdown_timer.dart';
import 'package:animecountdown/widgets/thin_outline_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:animecountdown/models/anilist_api/anime.dart';
import 'package:animecountdown/constant.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:cache_image/cache_image.dart';

class AnimeCard extends StatefulWidget {
  final Anime anime;
  final Function iconClick;
  final Color activeIcon;
  final Color inActiveIcon;
  final Color background;
  final Color textColor;
  final Color btnHighlightColor;
  final bool darkMode;

  AnimeCard(
      {@required this.anime,
      @required this.activeIcon,
      @required this.inActiveIcon,
      @required this.background,
      @required this.textColor,
      @required this.darkMode,
      this.btnHighlightColor,
      this.iconClick});

  @override
  _AnimeCardState createState() => _AnimeCardState();
}

class _AnimeCardState extends State<AnimeCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AnimeData>(builder: (context, animeData, child) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Container(
            height: 300,
            decoration: BoxDecoration(
                color: widget.background,
                borderRadius: BorderRadius.circular(10),
                boxShadow: widget.darkMode
                    ? null
                    : [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        )
                      ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 185,
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      image: DecorationImage(
                          image: CacheImage(widget.anime.coverImage),
                          fit: BoxFit.cover)),
                ),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.anime.title.romaji,
                                style: TextStyle(
                                    color: widget.textColor, fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  widget.anime.averageScore != null
                                      ? 'Score: ' +
                                          widget.anime.averageScore.toString()
                                      : "Score: TBD",
                                  style: TextStyle(
                                      color: widget.textColor, fontSize: 20)),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  'Studios: ' +
                                      StudioList.studiosStringify(
                                          widget.anime.studios.studio),
                                  style: TextStyle(
                                      color: widget.textColor, fontSize: 20)),
                            ],
                          ),
                          Expanded(
                            child: Container(
                                alignment: Alignment.center,
                                child: widget.anime.nextAiringEpisode != null
                                    ? CountdownTimer(
                                        secondsRemaining: widget
                                                .anime
                                                .nextAiringEpisode
                                                .timeUntilAiring ??
                                            0,
                                        whenTimeExpires: () {
//                                todo get timer for next episode
                                        },
                                        countDownTimerStyle: TextStyle(
                                            color: widget.activeIcon,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : SizedBox()),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ThinOutlineBtn(
                                padding: 0,
                                primaryColor: widget.activeIcon,
                                darkColor:
                                    widget.btnHighlightColor ?? kInActiveHeart,
                                text: "Details",
                                highlightedBorderColor: widget.activeIcon,
                                ontap: () {
                                  pushNewScreen(
                                    context,
                                    screen: AnimeScreen(anime: widget.anime),
                                    withNavBar:
                                        true, // OPTIONAL VALUE. True by default.
                                    pageTransitionAnimation:
                                        PageTransitionAnimation.cupertino,
                                  );
                                },
                              ),
                              GestureDetector(
                                onTap: () {
                                  animeData.favourite(widget.anime);
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.solidHeart,
                                  size: 40,
                                  color: widget.anime.favourite
                                      ? widget.activeIcon
                                      : widget.inActiveIcon,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
      );
    });
  }
}
