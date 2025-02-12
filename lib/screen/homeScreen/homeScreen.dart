import 'package:flutter/material.dart';
import 'package:movie_app/components/appbar/appBarControl.dart';
import 'package:movie_app/components/ui/cardMovie.dart';
import 'package:movie_app/model/movieModel.dart';
import 'package:movie_app/service/movieService.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> futureNowPlayingMovies;
  late Future<List<Movie>> futureMostMovies;

  @override
  void initState() {
    super.initState();
    futureNowPlayingMovies = Movieservice().fetchNowPlayingMovies();
    futureMostMovies = Movieservice().fetchMostMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff060420),
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          MovieSection(
              title: "Now Playing", futureMovies: futureNowPlayingMovies),
          const SizedBox(
            height: 20,
          ),
          MovieSection(title: "Most Popular", futureMovies: futureMostMovies),
        ],
      ),
    );
  }
}

class MovieSection extends StatelessWidget {
  final String title;
  final Future<List<Movie>> futureMovies;

  const MovieSection(
      {Key? key, required this.title, required this.futureMovies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("See All", style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 220,
          child: FutureBuilder<List<Movie>>(
            future: futureMovies,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("No movies found"));
              } else {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final movie = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CardMovie(
                        imageUrl:
                            "https://image.tmdb.org/t/p/w200${movie.posterPath}",
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
