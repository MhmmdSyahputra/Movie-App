import 'package:flutter/material.dart';
import 'package:movie_app/components/ui/listMovie.dart';
import 'package:movie_app/model/movieModel.dart';
import 'package:movie_app/providers/movieProvider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteWatchlistModel = Provider.of<FavoriteWatchlistModel>(context);

    return Scaffold(
      backgroundColor: const Color(0xff060420),
      appBar: AppBar(
        backgroundColor: const Color(0xff060420),
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'My Profile',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          dividerColor: Colors.transparent,
          tabs: const [
            Tab(text: "Watchlist"),
            Tab(text: "Favorite"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          MovieListSection(movies: favoriteWatchlistModel.watchlist),
          MovieListSection(movies: favoriteWatchlistModel.favorites),
        ],
      ),
    );
  }
}

class MovieListSection extends StatelessWidget {
  final List<Movie> movies;

  const MovieListSection({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: movies.map((movie) {
        return MovieListCard(movie: movie);
      }).toList(),
    );
  }
}