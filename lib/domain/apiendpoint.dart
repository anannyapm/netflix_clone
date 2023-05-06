import '../infrastructure/apikey.dart';

const kBaseUrl = "https://api.themoviedb.org/3";

class ApiEndPoints {
  static const trendingall = "$kBaseUrl/trending/all/day?api_key=$apiKey";

  static const movielatest =
      "$kBaseUrl/latest?api_key=$apiKey&language=en-US&page=1";

  static const tvpopular =
      "$kBaseUrl/tv/popular?api_key=$apiKey&language=en-US&page=1";

  static const upcoming =
      "$kBaseUrl/movie/upcoming?api_key=$apiKey&language=en-US&page=1";

  static const toprate =
      '$kBaseUrl/movie/top_rated?api_key=$apiKey&language=en-US&page=1';

  static const moviepopular =
      '$kBaseUrl/movie/popular?api_key=$apiKey&language=en-US&page=1';

  static const searchmovie = '$kBaseUrl/search/movie?api_key=$apiKey&query=';

  static const tvtoprate =
      '$kBaseUrl/discover/tv?include_adult=false&language=en-US&page=1&sort_by=vote_average.desc&vote_count.gte=200&api_key=$apiKey';
}
