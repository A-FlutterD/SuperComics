import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:super_comics_app/models/superhero.dart';

class SuperheroeService {
  final _baseUrl = 'https://www.superheroapi.com/api.php/';
  final _apiKey = '10157703717092094/';

  Future<List<Superhero>> searchSuperheroes(
      String endpoint, String name) async {
    http.Response response =
        await http.get(Uri.parse('$_baseUrl$_apiKey$endpoint/$name'));
    if (response.statusCode == HttpStatus.ok) {
      final dynamic jsonResponse = json.decode(response.body);
      if (jsonResponse is Map && jsonResponse.containsKey('results')) {
        final List<dynamic> superheroeList = jsonResponse['results'];
        return superheroeList
            .map((superhero) => Superhero.fromJson(superhero))
            .toList();
      } else {
        return [];
      }
    }
    return [];
  }

  
}
