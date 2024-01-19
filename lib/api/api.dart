import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieapp/api/constants.dart';
import 'package:movieapp/models/movie.dart';

class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.apikey}';
  static const _topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apikey}';
  static const _upcomingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apikey}';

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;

      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;

      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(_upcomingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;

      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }


  Future<List<CastModel>> getCasts({required String id}) async {
    
    final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/$id/credits?api_key=${Constants.apikey}'));

    if (response.statusCode == 200) {
  
        final decodedData = json.decode(response.body)['cast'] as List; 
     return decodedData.map((cast) => CastModel.fromjson(cast)).toList();

    } else {
      throw Exception('Failed to load casts of this movie');
    }
  }

}
