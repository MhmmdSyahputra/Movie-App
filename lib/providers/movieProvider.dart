import 'package:flutter/material.dart';
import 'package:movie_app/model/movieModel.dart';

class FavoriteWatchlistModel extends ChangeNotifier {
  List<Movie> _favorites = [];
  List<Movie> _watchlist = [];

  List<Movie> get favorites => _favorites;
  List<Movie> get watchlist => _watchlist;

  void addToFavorites(Movie movie) {
    if (!_favorites.contains(movie)) {
      _favorites.add(movie);
      notifyListeners();
    }
  }

  void removeFromFavorites(Movie movie) {
    _favorites.remove(movie);
    notifyListeners();
  }

  void addToWatchlist(Movie movie) {
    if (!_watchlist.contains(movie)) {
      _watchlist.add(movie);
      notifyListeners();
    }
  }

  void removeFromWatchlist(Movie movie) {
    _watchlist.remove(movie);
    notifyListeners();
  }
}