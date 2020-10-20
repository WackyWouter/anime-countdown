import 'package:animecountdown/models/anime_data.dart';
import 'package:animecountdown/widgets/countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:animecountdown/models/anime.dart';

class AnimeCard extends StatefulWidget {
  final Anime anime;
  final Function iconClick;
  final Color activeIcon;
  final Color inactiveIcon;
  final Color background;
  final Color textColor;
  final bool darkMode;

  AnimeCard(
      {@required this.anime,
      @required this.activeIcon,
      @required this.inactiveIcon,
      @required this.background,
      @required this.textColor,
      @required this.darkMode,
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
                        bottomLeft: Radius.circular(10),
                      ),
                      image: DecorationImage(
                          image: NetworkImage(widget.anime.coverImage),
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.anime.title,
                                    style: TextStyle(
                                        color: widget.textColor, fontSize: 20),
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
                                          : widget.inactiveIcon,
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                  'Score: ' +
                                          widget.anime.averageScore
                                              .toString() ??
                                      'TBD',
                                  style: TextStyle(
                                      color: widget.textColor, fontSize: 20)),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  'Studios: ' +
                                      studiosStringify(widget.anime.studios),
                                  style: TextStyle(
                                      color: widget.textColor, fontSize: 20)),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: CountdownTimer(
                                secondsRemaining: widget.anime.nextEpisode ?? 0,
                                whenTimeExpires: () {
//                            todo get timer for next episode
                                },
                                countDownTimerStyle: TextStyle(
                                    color: widget.activeIcon,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
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

  String studiosStringify(List<String> studios) {
    String studioString = '';
    studios.forEach((element) {
      studioString += element.toString() + ', ';
    });

    if (studioString.length >= 2) {
      if (studioString.substring(studioString.length - 2) == ', ') {
        studioString = studioString.substring(0, studioString.length - 2) ?? '';
      }
    }

    return studioString;
  }
}
