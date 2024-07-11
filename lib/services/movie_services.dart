import 'dart:convert';

import '../models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieServices {
  final BASE_URL = 'https://api.themoviedb.org/3/movie/';
  final headers = {
    'Authorization':
        'Bearer  eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YmUyNjU2ZDBlMzYyYjQwMDIzZjgxZDAyMDc4NGYyMCIsIm5iZiI6MTcyMDE3Mzk0Ny4yMTkzMTgsInN1YiI6IjY2ODdjNDM1NDMxNzNmZjYwMzVlNWJhOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.y0c4ZnxlAcfth_wUHqYPOsXb9iUeiIg_zvQiv9EBzYw',
    'accept': 'application/json',
  };

  Future<List<Movie>> fetchTopRatedMovies() async {
    final response = await http.get(
        Uri.parse('${BASE_URL}top_rated?language=en-US&page=1'),
        headers: headers);

    if (response.statusCode == 200) {
      return ((json.decode(response.body)['results']) as List)
          .map((e) => Movie.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Movie>> fetchUpcomingMovies() async {
    final response = await http.get(
        Uri.parse('${BASE_URL}upcoming?language=en-US&page=1'),
        headers: headers);

    if (response.statusCode == 200) {
      return ((json.decode(response.body)['results']) as List)
          .map((e) => Movie.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Movie>> fetchNowPlayingMovies() async {
    final response = await http.get(
        Uri.parse('${BASE_URL}now_playing?language=en-US&page=1'),
        headers: headers);
    if (response.statusCode == 200) {
      return ((json.decode(response.body)['results']) as List)
          .map((e) => Movie.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Movie>> fetchPopularMovies() async {
    final response = await http.get(
        Uri.parse('${BASE_URL}popular?language=en-US&page=1'),
        headers: headers);

    if (response.statusCode == 200) {
      return ((json.decode(response.body)['results']) as List)
          .map((e) => Movie.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Movie>> searchMovies(String query) async {
    final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/search/movie?${query}include_adult=false&language=en-US&page=1'),
        headers: headers);
    if (response.statusCode == 200) {
      return ((json.decode(response.body)['results']) as List)
          .map((e) => Movie.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
