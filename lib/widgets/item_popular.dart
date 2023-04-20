import 'package:flutter/material.dart';
import '../models/popular_model.dart';
import '../screens/details_movie.dart';

class ItemPopular extends StatelessWidget {
  const ItemPopular({super.key, required this.popularModel });

  final PopularModel popularModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: FadeInImage(
        fit: BoxFit.fill,
        placeholder: const AssetImage('assets/loading.gif'), 
        image: NetworkImage('https://image.tmdb.org/t/p/w500/${popularModel.posterPath}'),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsMovie(id: popularModel.id!, title: popularModel.originalTitle, raiting: popularModel.voteAverage, description: popularModel.overview, release_date: popularModel.releaseDate, poster_path: popularModel.posterPath)));
      },
    );
  }
}