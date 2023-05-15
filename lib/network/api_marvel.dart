import 'dart:convert';

import 'package:practica1/models/marvel_comic_model.dart';
import 'package:practica1/models/marvel_event_model.dart';
import 'package:practica1/models/marvel_character_model.dart';
import 'package:http/http.dart' as http;

class ApiMarvel{

  Future<List<MarvelModel>?> getAllCharacters() async {
    Uri link = Uri.parse('https://gateway.marvel.com:443/v1/public/characters?limit=100&ts=spider&apikey=b5f22b68ecc17073749b5552108cd1b5&hash=08f58e5f5d29a6356c51fb76efbc52e9');

    var result = await http.get(link);
    //print(jsonDecode(result.body)['data']['results']);
    var listJSON = jsonDecode(result.body)['data']['results'] as List;
    if( result.statusCode == 200 ){
      return listJSON.map((popular) => MarvelModel.fromMap(popular)).toList(); 
    }
    return null;
  }

  Future<List<MarvelComicModel>?> getAllComics(int? idCharacter) async {
    Uri link = Uri.parse('https://gateway.marvel.com:443/v1/public/characters/$idCharacter/comics?limit=100&ts=spider&apikey=b5f22b68ecc17073749b5552108cd1b5&hash=08f58e5f5d29a6356c51fb76efbc52e9');

    var result = await http.get(link);
    //print('GETALLCOMICS:');
    //print(jsonDecode(result.body)['data']['results']);
    var listJSON = jsonDecode(result.body)['data']['results'] as List;
    if( result.statusCode == 200 ){
      return listJSON.map((comic) => MarvelComicModel.fromMap(comic)).toList(); 
    }
    return null;
  }
  
  Future<List<MarvelEventModel>?> getAllEvents(int? idCharacter) async {
    Uri link = Uri.parse('https://gateway.marvel.com:443/v1/public/characters/$idCharacter/events?limit=100&ts=spider&apikey=b5f22b68ecc17073749b5552108cd1b5&hash=08f58e5f5d29a6356c51fb76efbc52e9');

    var result = await http.get(link);
    //print('GETALLEVENTS:');
    //print(jsonDecode(result.body)['data']['results']);
    var listJSON = jsonDecode(result.body)['data']['results'] as List;
    if( result.statusCode == 200 ){
      return listJSON.map((event) => MarvelEventModel.fromMap(event)).toList(); 
    }
    return null;
  }
}