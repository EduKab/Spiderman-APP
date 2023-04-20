import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:practica1/models/marvel_event_model.dart';
import 'package:styled_text/styled_text.dart';

class ItemMarvelEvent extends StatelessWidget {
  ItemMarvelEvent({super.key, required this.marvelEventModel});

  MarvelEventModel marvelEventModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.cyan[100]),
      child: Column(
        children: [
          InstaImageViewer(
            child: Image(
              image: Image.network(
                '${marvelEventModel.thumbnail_path}' + '.${marvelEventModel.thumbnail_extension}',
              ).image,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              marvelEventModel.title.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          StyledText(
            textAlign: TextAlign.center,
            text: '<bold>START: </bold>' + '${marvelEventModel.start.toString()}',
            tags: {
              'bold': StyledTextTag(style: TextStyle(fontWeight: FontWeight.bold))
            }
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: StyledText(
              textAlign: TextAlign.center,
              text: '<bold>END: </bold>' + '${marvelEventModel.end.toString()}',
              tags: {
                'bold': StyledTextTag(style: TextStyle(fontWeight: FontWeight.bold))
              }
            ),
          )
        ],
      ),
    );
  }
}