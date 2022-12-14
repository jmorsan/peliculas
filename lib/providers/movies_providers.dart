import 'package:peliculas/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/popular_response.dart';

import '../models/credits_responses.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = '57b768579acb56e6c5ddb5836c5e31a6';
  final String _lenguage = 'es-ES';
  final String _baseUrl = 'api.themoviedb.org';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> moviesCast = {};

  int _popularPage = 0;
  int _onDisplayMoviesPage = 0;

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint, {
      'api_key': _apiKey,
      'language': _lenguage,
      'page': '$page',
    });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    _onDisplayMoviesPage++;
    final jsonData = await _getJsonData('3/movie/now_playing',_onDisplayMoviesPage);

    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovies = [...onDisplayMovies,...nowPlayingResponse.results];
    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;

    final jsonData = await _getJsonData('3/movie/popular', _popularPage);

    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);

    moviesCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }
}
