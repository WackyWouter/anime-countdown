import 'package:animecountdown/widgets/countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnimeCard extends StatelessWidget {
  final String title;
  final String coverImage;
  final List<String> studio;
  final int score;
  final int nextEpisode;
  final bool isFavourite;
  final Function iconClick;
  final Color activeIcon;
  final Color inactiveIcon;
  final Color background;
  final Color textColor;
  final bool darkMode;

  AnimeCard(
      {@required this.title,
      @required this.coverImage,
      @required this.isFavourite,
      @required this.activeIcon,
      @required this.inactiveIcon,
      @required this.background,
      @required this.textColor,
      @required this.darkMode,
      this.studio,
      this.score,
      this.nextEpisode,
      this.iconClick});

  @override
  Widget build(BuildContext context) {
//    Todo create a proper card
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Container(
          height: 300,
          decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(10),
              boxShadow: darkMode
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
                        image: NetworkImage(coverImage), fit: BoxFit.cover)),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  title,
                                  style:
                                      TextStyle(color: textColor, fontSize: 20),
                                ),
                                FaIcon(
                                  FontAwesomeIcons.solidHeart,
                                  size: 40,
                                  color: activeIcon,
                                )
                              ],
                            ),
                            Text('Score: ' + score.toString(),
                                style:
                                    TextStyle(color: textColor, fontSize: 20)),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Studios: ' + studiosStringify(studio),
                                style:
                                    TextStyle(color: textColor, fontSize: 20)),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: CountdownTimer(
                              secondsRemaining: nextEpisode,
                              whenTimeExpires: () {
//                            todo get timer for next episode
                              },
                              countDownTimerStyle: TextStyle(
                                  color: activeIcon,
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
