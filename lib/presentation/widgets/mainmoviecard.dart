import 'package:flutter/material.dart';

final String dummyUrl =
    'https://www.themoviedb.org/t/p/original/zPOc45oBZNQRLsRw5M5JoKv2yUQ.jpg';


class MainMovieCard extends StatelessWidget {
  const MainMovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(dummyUrl),fit: BoxFit.cover),
      borderRadius: BorderRadius.circular(7)
      ),
      
    );
  }
}
