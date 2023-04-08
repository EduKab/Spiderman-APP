import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practica1/models/credit_popular_model.dart';
import 'package:practica1/models/video_popular_model.dart';
import '../models/popular_model.dart';

class ApiPopular {
  
  Uri link = Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=5019e68de7bc112f4e4337a500b96c56&language=en-US&page=1');

  Future<List<PopularModel>?> getAllPopular() async {
    var result = await http.get(link);
    var listJSON = jsonDecode(result.body)['results'] as List;
    if( result.statusCode == 200 ){
      return listJSON.map((popular) => PopularModel.fromMap(popular)).toList(); 
    }
    return null;
  }

  Future<List<VideoPopularModel>?> getVideos(movieID) async {
    Uri linkVideos = Uri.parse('https://api.themoviedb.org/3/movie/${movieID}/videos?api_key=5019e68de7bc112f4e4337a500b96c56&language=en-US');

    var result = await http.get(linkVideos);
    var listJSON = jsonDecode(result.body)['results'] as List;
    if( result.statusCode == 200 ){
      return listJSON.map((video) => VideoPopularModel.fromMap(video)).toList(); 
    }
    return null;
  }

  Future<List<CreditPopularModel>?> getCredits(movieID) async {
    Uri linkCredits = Uri.parse('https://api.themoviedb.org/3/movie/${movieID}/credits?api_key=5019e68de7bc112f4e4337a500b96c56&language=en-US');

    var result = await http.get(linkCredits);
    var listJSON = jsonDecode(result.body)['cast'] as List;
    if( result.statusCode == 200 ){
      return listJSON.map((cast) => CreditPopularModel.fromMap(cast)).toList(); 
    }
    return null;
  }
}