import 'package:flutter/material.dart';
import 'package:practica1/database/database_helper.dart';

import '../models/fav_movie_model.dart';

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
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .9,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10
              ), 
              itemCount: snapshot.data != null ? snapshot.data!.length : 0,
              itemBuilder: (context, index) {
                return FadeInImage(
                  fit: BoxFit.fill,
                  placeholder: const AssetImage('assets/loading.gif'), 
                  image: NetworkImage('https://image.tmdb.org/t/p/w500/${snapshot.data![index].poster_path.toString()}'),
                );
                //return Container(child: Image.network('https://image.tmdb.org/t/p/w500${snapshot.data![index].poster_path.toString()}'));
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