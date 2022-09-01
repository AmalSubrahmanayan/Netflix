import 'package:neetflix/core/strings.dart';
import 'package:neetflix/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$kBaseUrl/trending/all/day?api_key=$apiKey";
  static const search = "$kBaseUrl/search/movie?api_key=$apiKey";
  static const hotAndNewMovie = '$kBaseUrl/discover/movie?api_key=$apiKey';
  static const hotAndNewTv = '$kBaseUrl/discover/movie?api_key=$apiKey';
}
