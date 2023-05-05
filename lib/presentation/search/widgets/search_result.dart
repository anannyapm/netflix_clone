import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:netflix/core/constants/constant.dart';
import 'package:netflix/domain/apiendpoint.dart';
import 'package:netflix/infrastructure/apikey.dart';
import 'package:netflix/infrastructure/base_client.dart';
import 'package:netflix/presentation/search/widgets/titlewidget.dart';

import '../../../model/movie_info.dart';
import '../../widgets/mainmoviecard.dart';

const imageUrl =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWWsVTjDaK9xTorMHSm6oxAll80fttPtDPkg&usqp=CAU";

class SearchResultWidget extends StatelessWidget {
  final String apiQuery;
  const SearchResultWidget({super.key, required this.apiQuery});

  @override
  Widget build(BuildContext context) {
                  List imageList = [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchPageTitleWIdget(title: "Movies & TV"),
        kHeight,
        Expanded(
            child: FutureBuilder(
                future: apicall(ApiEndPoints.searchmovie + apiQuery),
                builder: (context, snapshot) {
                  
                  if (!snapshot.hasData) {
                ;
                    return const Text('Please wait');
                  }

                  if (snapshot.data == null) {
                 

                    return const Text('No data found');
                  }
                  imageList =
                      snapshot.data.results.map((MovieInfoModel movieInfo) {
                    if (movieInfo.posterPath == null) {
                      return null;
                    }
                    String imageUrl =
                        'https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=$apiKey';
                    return imageUrl;
                  }).toList();
                  

                  if (imageList.isEmpty) {
                   

                    return ListTile(title: Text('No Movies Found'));
                  }

                  return GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 9,
                      crossAxisSpacing: 9,
                      childAspectRatio: 1 / 1.4,
                      shrinkWrap: true,
                      children: List.generate(imageList.length, (index) {
                        return MainMovieCard(
                          imageUrl: imageList[index],
                        );
                      }));
                }))
      ],
    );
  }
}
