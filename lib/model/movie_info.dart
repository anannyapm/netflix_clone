class MovieInfoModel {
  final bool adult;
  final String backdropPath;
  final int id;
  final String? title;
  final String originalLanguage;
  final String? originalTitle;
  final String overview;
  final String? posterPath;
  final String mediaType;
  final List genreIds;
  final double popularity;
  final String? releaseDate;
  final bool? video;
  final num voteAverage;
  final int voteCount;

  MovieInfoModel.fromJson(Map data)
      : adult = data['adult'] ?? false,
        backdropPath = data['backdrop_path'] ?? "",
        id = data['id'],
        title = data['title'],
        originalLanguage = data['original_language'],
        originalTitle = data['original_title'],
        overview = data['overview'],
        posterPath = data['poster_path'],
        mediaType = data['media_type'] ?? "",
        genreIds = data['genre_ids'],
        popularity = data['popularity'],
        releaseDate = data['release_date'],
        video = data['video'],
        voteAverage = data['vote_average'] ?? 0.0,
        voteCount = data['vote_count'] ?? 0;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['title'] = title;
    data['orginal_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['media_type'] = mediaType;
    data['genre_ids'] = genreIds;
    data['popularity'] = popularity;
    data['release_date'] = releaseDate;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'];

    return data;
  }
}
