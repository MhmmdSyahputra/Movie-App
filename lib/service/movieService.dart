import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/model/movieModel.dart';

class Movieservice {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "3c4b2b03066ef934cfc36d006f9d3462";

  Future<List<Movie>> fetchNowPlayingMovies() async {
    final response = await http.get(
      Uri.parse("$baseUrl/movie/now_playing?api_key=$apiKey"),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> results = data['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load movies");
    }
  }

  Future<List<Movie>> fetchMostMovies() async {
    final response = await http.get(
      Uri.parse("$baseUrl/movie/popular?api_key=$apiKey"),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> results = data['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load movies");
    }
  }

  Future<List<Movie>> fetchByGenreMovies(List genreIds) async {
    String cleanGenreIds = genreIds.join(",");
    final response = await http.get(
      Uri.parse(
          "$baseUrl/discover/movie?api_key=$apiKey&with_genres=$cleanGenreIds"),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> results = data['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load movies");
    }
  }

  
}
