import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:practica1/database/database_helper.dart';
import 'package:sqflite/sqflite.dart';

import '../models/fav_movie_model.dart';
import '../models/popular_model.dart';
import '../network/api_popular.dart';
import '../widgets/item_popular.dart';

class ListFavoritesMovies extends StatefulWidget {
  const ListFavoritesMovies({super.key});

  @override
  State<ListFavoritesMovies> createState() => _ListFavoritesMoviesState();
}

class _ListFavoritesMoviesState extends State<ListFavoritesMovies> {
  DatabaseHelper? database;

  @override
  void initState() {
    super.initState();
    database = DatabaseHelper();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Popular'),),
      body: FutureBuilder(
        future: database?.getAllFavorite(),
        builder: (context, AsyncSnapshot<List<FavMovieModel>?> snapshot ) {
          if( snapshot.hasData ){
            return GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .9,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10
              ), 
              itemCount: snapshot.data != null ? snapshot.data!.length : 0,
              itemBuilder: (context, index) {
                //return ItemPopular(popularModel: snapshot.data![index]);
              },
            );
          }else if( snapshot.hasError){
            return const Center(child: Text('Ocurrio un error :()'),);
          }else{
            return const CircularProgressIndicator();
          }
        }
      ),
    );
  }
}