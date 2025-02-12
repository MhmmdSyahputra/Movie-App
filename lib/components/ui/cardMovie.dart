import 'package:flutter/material.dart';
import 'package:movie_app/model/movieModel.dart';
import 'package:movie_app/providers/movieProvider.dart';
import 'package:provider/provider.dart';

class CardMovie extends StatelessWidget {
  final Movie movie;

  const CardMovie({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteWatchlistModel = Provider.of<FavoriteWatchlistModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://image.tmdb.org/t/p/w200${movie.posterPath}',
              width: 150,
              height: 220,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 150,
          child: Text(
            movie.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: SizedBox(
                  width: 150,
                  child: Text(
                    movie.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  favoriteWatchlistModel.favorites.contains(movie)
                      ? Icons.bookmark
                      : Icons.bookmark_border,
                  color: Colors.white,
                ),
                onPressed: () {
                  if (favoriteWatchlistModel.favorites.contains(movie)) {
                    favoriteWatchlistModel.removeFromFavorites(movie);
                  } else {
                    favoriteWatchlistModel.addToFavorites(movie);
                  }
                },
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: Icon(
                  favoriteWatchlistModel.watchlist.contains(movie)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.white,
                ),
                onPressed: () {
                  if (favoriteWatchlistModel.watchlist.contains(movie)) {
                    favoriteWatchlistModel.removeFromWatchlist(movie);
                  } else {
                    favoriteWatchlistModel.addToWatchlist(movie);
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
