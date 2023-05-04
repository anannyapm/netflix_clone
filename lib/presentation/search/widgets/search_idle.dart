import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/presentation/search/widgets/titlewidget.dart';

import '../../../core/constants/constant.dart';
const imageUrl =
      'https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/q7vmCCmyiHnuKGMzHZlr0fD44b9.jpg';


class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchPageTitleWIdget(title: "Top Searches",),
        kHeight,
        Expanded(
         
            child: ListView.separated(
              itemBuilder: (context,index)=>TopSearchItemTile(), 
              separatorBuilder: (context,index)=>kHeight20,
              itemCount: 10),
  
        )
      ],
    );
  }
}



class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth*0.35,
          height: 65,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(imageUrl),
            fit: BoxFit.cover)
    
          ),
        ),
        Expanded(child: Text("Movie Name",
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
        Icon(CupertinoIcons.play_circle,size: 50,)

    
    
      ],
    );
  }
}