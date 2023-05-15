import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:practica1/models/marvel_comic_model.dart';

class ItemMarvelComic extends StatelessWidget {
  ItemMarvelComic({super.key, required this.marvelComicModel});

  MarvelComicModel marvelComicModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InstaImageViewer(
          child: Image.network(
            '${marvelComicModel.thumbnail_path}' '.${marvelComicModel.thumbnail_extension}',
            height: 200,
            width: 200
          ),
        ),
        Text(
          marvelComicModel.title.toString().toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}