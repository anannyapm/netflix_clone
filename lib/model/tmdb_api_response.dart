import 'movie_info.dart';

class TMDBApiResponseModel {
  int page = 0;
  List<MovieInfoModel> results = [];
  int totalPages = 0;
  int totalResults = 0;

  TMDBApiResponseModel.fromJson(Map data) {
    page = data['page'];
    results = List<MovieInfoModel>.from(data['results'].map((item) {
      MovieInfoModel movieInfo = MovieInfoModel.fromJson(item);
      return movieInfo;
    }));
    totalPages = data['total_pages'];
    totalResults = data['total_results'];
  }

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
