import '../infrastructure/apikey.dart';

const kBaseUrl = "https://api.themoviedb.org/3";

class ApiEndPoints {
  static const trendingall = "$kBaseUrl/trending/all/day?api_key=$apiKey";
  static const movielatest =
      "https://api.themoviedb.org/3/movie/latest?api_key=9078fde7e5b4c8b7cd8ecf516d2d4c53&language=en-US&page=1";
  static const tvpopular =
      "$kBaseUrl/tv/popular?api_key=$apiKey&language=en-US&page=1";
  static const upcoming =
      "$kBaseUrl/movie/upcoming?api_key=$apiKey&language=en-US&page=1";
  static const toprate =
      '$kBaseUrl/movie/top_rated?api_key=$apiKey&language=en-US&page=1';
  static const moviepopular =
      '$kBaseUrl/movie/popular?api_key=$apiKey&language=en-US&page=1';
  static const searchmovie = '$kBaseUrl/search/movie?api_key=$apiKey&query=';
}
