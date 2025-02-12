class Movie {
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final double popularity;
  final String releaseDate;
  final double voteAverage;
  // final String genreIds;

  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.popularity,
    required this.releaseDate,
    required this.voteAverage,
    // required this.genreIds,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'] ?? '',
      overview: json['overview'],
      popularity: json['popularity'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'],
      // genreIds: json['genre_ids'],
    );
  }
}
