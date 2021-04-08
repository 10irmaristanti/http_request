import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_request/models/movie.dart';

class HttpService{
  final String apikey = '25f07d9bcf99bf18c16a4de0b5d726e3';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/550?api_key=25f07d9bcf99bf18c16a4de0b5d726e3';

  Future<List> getPopularMovies() async {
    final String uri = baseUrl + apikey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['result'];
      List movies = moviesMap.map((i) => Movie.fromJson((i).toList()));
      return movies;
    } else {
      print("Fail");
      return null;
    }
  }
}