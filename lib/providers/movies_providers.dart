
import 'package:peliculas/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/popular_response.dart';


class MoviesProvider extends ChangeNotifier{

final String _apiKey = '57b768579acb56e6c5ddb5836c5e31a6';
final String _lenguage = 'es-ES';
final String _baseUrl='api.themoviedb.org';

List<Movie> onDisplayMovies=[];
List<Movie> popularMovies=[];

int popularPage=0;

  MoviesProvider(){
    getOnDisplayMovies();

    getPopularMovies();

  }

  Future<String> _getJsonData(String endpoint, [int page = 1])async{

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
    return response.body;

  }
  getOnDisplayMovies() async{
      final jsonData = await _getJsonData('3/movie/now_playing',1);
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    
    print(nowPlayingResponse.results[1].title);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularMovies()async{
      popularPage++;

    final jsonData = await _getJsonData('3/movie/popular', popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [...popularMovies, ...popularResponse.results];

    notifyListeners();
  }
}