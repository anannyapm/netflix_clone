import 'package:flutter/material.dart';
import 'package:netflix/domain/apiendpoint.dart';
import 'package:netflix/infrastructure/base_client.dart';
import 'package:netflix/presentation/widgets/playbutton.dart';

import '../../core/constants/constant.dart';
import '../../model/movie_info.dart';
import 'custombutton.dart';

class BackgroundCard extends StatefulWidget {
  const BackgroundCard({
    super.key,
  });

  @override
  State<BackgroundCard> createState() => _BackgroundCardState();
}

class _BackgroundCardState extends State<BackgroundCard> {
  @override
  initState() {
    super.initState();
    setImage();
  }

  setImage() async {
    dynamic result = await apicall(ApiEndPoints.trendingall);

    setState(() {
      if (result.results.isNotEmpty) {
        MovieInfoModel movieInfo = result.results[0];
        imageUrl =
            "https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=b2dee3b855c4ea705ff5dda3c0201768";
      }
    });
  }

  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl ?? kMainImage),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CustomButtonWidget(
                  title: "My List",
                  icon: Icons.add,
                ),
                PlayButton(),
                CustomButtonWidget(icon: Icons.info_outline, title: 'Info')
              ],
            ),
          ),
        )
      ],
    );
  }
}
