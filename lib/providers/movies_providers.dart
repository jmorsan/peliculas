
import 'package:peliculas/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MoviesProvider extends ChangeNotifier{

final String _apiKey = '57b768579acb56e6c5ddb5836c5e31a6';
final String _lenguage = 'es-ES';
final String _baseUrl='api.themoviedb.org';

List<Movie> onDisplayMovies=[];

  MoviesProvider(){
    getOnDisplayMovies();

  }

  getOnDisplayMovies() async{
      var url =
      Uri.https(
        _baseUrl,
        '3/movie/now_playing',
        {
        'api_key' : _apiKey,
        'language': _lenguage,
        'page' : '1',
        } 
      );
      

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    
    print(nowPlayingResponse.results[1].title);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }
}