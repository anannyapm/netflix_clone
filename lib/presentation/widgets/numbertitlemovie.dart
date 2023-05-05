import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:netflix/domain/apiendpoint.dart';
import 'package:netflix/infrastructure/base_client.dart';
import 'package:netflix/presentation/widgets/title_widget.dart';

import '../../core/constants/constant.dart';
import '../../model/movie_info.dart';
import 'numbercard.dart';

class NumberTitleMovieCard extends StatelessWidget {
  const NumberTitleMovieCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List imageList = [];

    return FutureBuilder(
        future:apicall(ApiEndPoints.toprate),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Please wait');
          }

          if (snapshot.data == null) {
            return Text('No data found');
          }
          

            imageList = snapshot.data.results.map((MovieInfoModel movieInfo) {
              if (movieInfo.posterPath == null) {
                return null;
              }
              String imageUrl =
                  'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=b2dee3b855c4ea705ff5dda3c0201768';
              return imageUrl;
            }).toList();
          
          if (imageList.isEmpty) {
            return ListTile(title: Text('No Movies Found'));
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: const EdgeInsets.all(8.0),
                child: TitleTextWidget(
                  title: 'Top 10 Tv Shows in India Today',
                ),
              ),
              kHeight,
              LimitedBox(
                maxHeight: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    10,
                    (index) => NumberCard(
                      index: index,
                      imageUrl: imageList[index],
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
