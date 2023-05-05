import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/constants/constant.dart';

class CustomeAppBar extends StatelessWidget {
  final Widget leftwidget;
  //final String title;
  const CustomeAppBar({super.key,required this.leftwidget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          leftwidget,
          const Spacer(),
          const Icon(Icons.cast, size: 30),
          kWidth,
          SizedBox(
            height: 30,
            width: 30,
            child: Image.asset("assets/avatar.png"),
          ),
          kWidth,
        ],
      ),
    );
  }
}
