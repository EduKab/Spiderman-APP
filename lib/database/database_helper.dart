import 'dart:io';
import 'package:flutter/material.dart';
import 'package:practica1/models/event_model.dart';
import 'package:practica1/models/popular_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../models/fav_movie_model.dart';
import '../models/post_model.dart';

class DatabaseHelper {
  
  static final nameDB = 'SOCIALDB5';
  static final versionDB = 1;

  static Database? _database;
  Future<Database> get database async {
    if( _database != null ) return _database!;
    return _database = await _initDatabase();
  }

  _initDatabase() async{
    Directory folder = await getApplicationDocumentsDirectory();
    String pathDB = join(folder.path, nameDB);
    return await openDatabase(
      pathDB,
      version: versionDB,
      onCreate: _createTables,
    );

  }

  _createTables(Database db, int version) async{
    db.execute('CREATE TABLE tblPost(idPost INTEGER PRIMARY KEY, dscPost VARCHAR(200), datePost DATE)');
    db.execute('CREATE TABLE tblFavMovie(idMovie INTEGER PRIMARY KEY, titleMovie VARCHAR(50), poster_path VARCHAR(100))');
    //db.execute('CREATE TABLE tblEvent( idEvent INTEGER PRIMARY KEY, nameEvent VARCHAR(50), descEvent VARCHAR(200), dateEvent DATE, startEvent INTEGER, endEvent INTEGER, compEvent INTEGER)');
  }

  Future<int> INSERT(String tblName, Map<String,dynamic> data) async{
    var conexion = await database;
    return conexion.insert(tblName, data);
  }

  Future<int> UPDATE(String tblName,Map<String,dynamic> data) async{
    var conexion = await database;
    return conexion.update(tblName,data,
    where: 'idPost = ?',
    whereArgs:[data['idPost']]);
  }

  Future<int> DELETE(String tblName, int idPost) async {
    var conexion = await database;
    return conexion.delete(tblName,
      where: 'idPost = ?',
      whereArgs: [idPost]);
  }

  Future<List<PostModel>> GetAllPost() async {
    var conexion = await database;
    var result = await conexion.query('tblPost');
    return result.map((post) => PostModel.fromMap(post)).toList();
  }

  Future<List<EventModel>> getAllEvent() async {
    var conexion = await database;
    var result = await conexion.query('tblEvent');
    return result.map((event) => EventModel.fromMap(event)).toList();
  }

  Future<int> updateFavMovie(String tblName, Map<String,dynamic> data) async{
    var conexion = await database;
    return conexion.update(tblName,data,
    where: 'idMovie = ?',
    whereArgs:[data['idMovie']]);
  }

  Future<int> deleteFavMovie(String tblName, int idMovie) async {
    var conexion = await database;
    return conexion.delete(tblName,
      where: 'idMovie = ?',
      whereArgs: [idMovie]);
  }
    
  Future<List<FavMovieModel>> getAllFavorite() async {
    var conexion = await database;
    var result = await conexion.query('tblFavMovie');
    return result.map((event) => FavMovieModel.fromMap(event)).toList();
  }

  Future<bool> getFavorite(int idMovie) async {
    var conexion = await database;
    var result = await conexion.rawQuery("SELECT * FROM tblFavMovie WHERE idMovie = ${idMovie}");
    print(result);
    if(result.isEmpty){
      return false;
    }
    return true;
  }

}