import 'package:flutter/material.dart';
import 'package:movie_app/model/movieModel.dart';
import 'package:movie_app/screen/homeScreen/homeScreen.dart';
import 'package:movie_app/service/movieService.dart';

class DetailMovieScreen extends StatefulWidget {
  final Movie movie; // Gantilah 'data' dengan 'movie'

  const DetailMovieScreen({super.key, required this.movie});

  @override
  State<DetailMovieScreen> createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
   late Future<List<Movie>> futureByGenreMovies;

  @override
  void initState() {
    super.initState();
    // futureByGenreMovies = Movieservice().fetchMostMovies();
    futureByGenreMovies = Movieservice().fetchByGenreMovies(widget.movie.genreIds);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff060420),
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xff25233D),
          title: Text(
            widget.movie.title,
            style: TextStyle(color: Colors.white),
          )),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Image.network(
              "https://image.tmdb.org/t/p/w500${widget.movie.posterPath}",
              width: 300,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            widget.movie.title,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            "Release Date: ${widget.movie.releaseDate}",
            style: const TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            widget.movie.overview,
            style: const TextStyle(fontSize: 16, color: Colors.white),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 30,),
          MovieSection(
              title: "Similar Movie", futureMovies: futureByGenreMovies),
        ],
      ),
    );
  }
}
