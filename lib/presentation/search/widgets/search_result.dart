import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:netflix/core/constants/constant.dart';
import 'package:netflix/presentation/search/widgets/titlewidget.dart';

import '../../widgets/mainmoviecard.dart';


class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchPageTitleWIdget(title: "Movies & TV"),
        kHeight,
        Expanded(
            child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 9,
                crossAxisSpacing: 9,
                childAspectRatio: 1/1.4,
                shrinkWrap: true,
                children: List.generate(20, (index) {
                  return const MainMovieCard();
                })))
      ],
    );
  }
}

