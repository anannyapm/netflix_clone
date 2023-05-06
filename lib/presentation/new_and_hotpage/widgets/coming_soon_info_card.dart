import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constant.dart';
import '../../../model/movie_info.dart';
import '../../widgets/custombutton.dart';
import '../../widgets/videowidget.dart';

class ComingSoonInfoCard extends StatelessWidget {
  const ComingSoonInfoCard({super.key, required this.movieInfo});
  final MovieInfoModel movieInfo;

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=b2dee3b855c4ea705ff5dda3c0201768';

    return Padding(
      padding: const EdgeInsets.only(top: 23.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            //height: 450,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  parseDateTime(movieInfo.releaseDate!),
                  style: const TextStyle(
                      fontSize: 18,
                      color: kWhiteColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoWidget(videoImage: imageUrl),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    Row(
                      children: const [
                        CustomButtonWidget(
                          icon: Icons.alarm_rounded,
                          title: 'Remind me',
                          iconSize: 17,
                          textSize: 12,
                        ),
                        kWidth,
                        CustomButtonWidget(
                          icon: Icons.info,
                          title: 'Info',
                          iconSize: 17,
                          textSize: 12,
                        ),
                        kWidth,
                      ],
                    )
                  ],
                ),
                kHeight,
                Text("Coming on ${getDayName(movieInfo.releaseDate!)}"),
                kHeight,
                Text(
                  movieInfo.originalTitle ?? 'Empty Title',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1,
                  ),
                ),
                kHeight,
                Text(
                  movieInfo.overview,
                  style: const TextStyle(color: kGreyColor),
                ),
                kHeight20
              ],
            ),
          ),
        ],
      ),
    );
  }

  String parseDateTime(String date) {
    DateTime dateInFormat = DateTime.parse(date);

    final dateFormatted = DateFormat.MMMMd().format(dateInFormat);

    final splitedDate = dateFormatted.split(' ');

    return "${splitedDate.first.substring(0, 3)} \n${splitedDate.last} ";
  }

  String getDayName(String date) {
    DateTime dateInFormat = DateTime.parse(date);
    final dayWeek = DateFormat('EEEE').format(dateInFormat);
    return dayWeek;
  }
}
