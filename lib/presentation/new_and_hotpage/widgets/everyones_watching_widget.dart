import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:netflix/domain/apiendpoint.dart';
import 'package:netflix/infrastructure/base_client.dart';

import 'everyones_watching_info_card.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apicall(ApiEndPoints.moviepopular),
        builder: (context,snapshot) {
          if (!snapshot.hasData) {
            return const Text('Please wait');
          }
          if (snapshot.data == null) {
            return const Text('No data found');
          }
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.results.length,
                itemBuilder: (BuildContext context, int index) =>
                    EveryonesWatchingInfoCard(
                        movieInfo: snapshot.data.results[index]));
          
        });
  }
}
