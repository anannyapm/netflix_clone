import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constant.dart';
import 'downloadsimage.dart';

class IntroDownloads extends StatelessWidget {
  IntroDownloads({
    super.key,
  });

  final List imageList = [
    'https://www.themoviedb.org/t/p/original/zPOc45oBZNQRLsRw5M5JoKv2yUQ.jpg',
    'https://www.themoviedb.org/t/p/original/kk8YxDDVBdI9s8NzkC0tUNQcAHG.jpg',
    'https://www.themoviedb.org/t/p/original/lLdUjbedjbQgHYIqiEVWcwmesRO.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kWhiteColor, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          "We will download a personalized selection of \nmovies and shows for you, so there's\n always something to watch on your\n device.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        
        Container(
          margin: EdgeInsets.zero,
          width: size.width,
          height: size.width*0.95,
          child: Stack(
            alignment: Alignment.center,
            children: imageList.length < 3
                ? []
                : [
                    CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.5),
                      radius: size.width * 0.38,
                    ),
                    DownloadsImageWidget(
                      image: imageList[0],
                      margin: const EdgeInsets.only(
                        left: 170,
                        top: 50,
                      ),
                      angle: 25,
                      size: Size(size.width * 0.32, size.width * 0.52),
                    ),
                    DownloadsImageWidget(
                      image: imageList[1],
                      margin: const EdgeInsets.only(right: 170, top: 50),
                      angle: -20,
                      size: Size(size.width * 0.32, size.width * 0.52),
                    ),
                    DownloadsImageWidget(
                      image: imageList[2],
                      radius: 8,
                      margin: const EdgeInsets.only(bottom: 35, top: 50),
                      size: Size(size.width * 0.37, size.width * 0.57),
                    ),
                  ],
          ),
        ),
      ],
    );
  }
}
