import 'package:neetflix/core/strings.dart';
import 'package:neetflix/infrastructure/api_key.dart';

class ApiEndPoints{
  static const downloads = "$kBaseUrl/trending/all/day?api_key=$apiKey";
}