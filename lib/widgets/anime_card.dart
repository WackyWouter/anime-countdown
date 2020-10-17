import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnimeCard extends StatelessWidget {
  final String title;
  final String coverImage;
  final String studio;
  final int score;
  final int nextEpisode;
  final bool isFavourite;
  final Function iconClick;
  final Color activeIcon;
  final Color inactiveIcon;
  final Color background;
  final Color textColor;

  AnimeCard(
      {@required this.title,
      @required this.coverImage,
      @required this.isFavourite,
      @required this.activeIcon,
      @required this.inactiveIcon,
      @required this.background,
      @required this.textColor,
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
          decoration: BoxDecoration(
              color: background, borderRadius: BorderRadius.circular(10)),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              title,
                              style: TextStyle(color: textColor, fontSize: 20),
                            ),
                            FaIcon(
                              FontAwesomeIcons.solidHeart,
                              size: 40,
                              color: activeIcon,
                            )
                          ],
                        ),
                        Text('Score: ' + score.toString(),
                            style: TextStyle(color: textColor, fontSize: 20)),
                        Text('Studios: ' + studio.toString(),
                            style: TextStyle(color: textColor, fontSize: 20)),
//                  Expanded(
//                    child: Text(
////                    TODO make this a countdown
//                      'days: 12, hours: 10, min: 40, sec: 02',
//                      style: TextStyle(color: activeIcon),
//                      maxLines: 2, // you can change it accordingly
//                      overflow: TextOverflow.ellipsis, // and th
//                    ),
//                  ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
