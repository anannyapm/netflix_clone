
import 'movie_info.dart';

class TMDBApiResponseModel {
  final int page;
  final List<MovieInfoModel> results;
  final int totalPages;
  final int totalResults;

  TMDBApiResponseModel.fromJson(Map data)
      : page = data['page'] ?? 0,
        results = data['results'] == null
            ? []
            : List<MovieInfoModel>.from(data['results'].map((item) {
                MovieInfoModel movieInfo = MovieInfoModel.fromJson(item);
                return movieInfo;
              })),
        totalPages = data['total_pages'] ?? 0,
        totalResults = data['total_results'] ?? 0;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['page'] = page;
    data['results'] =
        results.map((MovieInfoModel movieInfo) => movieInfo.toJson()).toList();
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;

    return data;
  }
}
