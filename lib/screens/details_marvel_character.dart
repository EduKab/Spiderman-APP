import 'dart:async';
import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:practica1/models/marvel_comic_model.dart';
import 'package:practica1/models/marvel_event_model.dart';
import 'package:practica1/models/marvel_character_model.dart';
import 'package:practica1/network/api_marvel.dart';
import 'package:practica1/widgets/item_marvel_comic.dart';
import 'package:practica1/widgets/item_marvel_event.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:styled_text/styled_text.dart';

class DetailsMarvelCharacter extends StatelessWidget {
  DetailsMarvelCharacter({super.key, required this.marvelModel});

  final MarvelModel marvelModel;
  ApiMarvel? apiMarvel = ApiMarvel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details ' + marvelModel.name.toString())),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              opacity: 0.1,
              image: NetworkImage('${marvelModel.thumbnail_path}' + '.${marvelModel.thumbnail_extension}'),
              fit: BoxFit.fill
            )
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InstaImageViewer(
                      child: Image.network(
                        '${marvelModel.thumbnail_path}' + '.${marvelModel.thumbnail_extension}',
                        width: 250,
                        height: 250,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      marvelModel.name.toString().toUpperCase(),
                      style: const TextStyle(fontFamily: 'Rowdies-Regular', fontSize: 30, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  )
                ]
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: 
                        marvelModel.description != '' 
                        ? StyledText(
                          text: '<bold>DESCRIPTION:</bold> ${marvelModel.description}',
                          tags: {
                            'bold': StyledTextTag(style: TextStyle(fontWeight: FontWeight.bold)),
                          },
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16),
                        )
                        : StyledText(
                          text: '<bold>DESCRIPTION:</bold> <red>NO DESCRIPTION AVAILABLE :(</red>',
                          tags: {
                            'bold': StyledTextTag(style: TextStyle(fontWeight: FontWeight.bold)),
                            'red': StyledTextTag(style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red))
                          },
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16),
                        )
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'COMIC APPEARANCES:',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: FutureBuilder(
                  future: apiMarvel?.getAllComics(marvelModel.id),
                  builder: (context, AsyncSnapshot<List<MarvelComicModel>?> snapshot ){
                    if(snapshot.hasData){
                      if (snapshot.data!.length > 0){
                        return SizedBox(
                          height: 250,
                          child: Swiper(
                          autoplay: true,
                          itemBuilder: (BuildContext context,int index){
                            return ItemMarvelComic(marvelComicModel: snapshot.data![index]);
                          },
                          itemCount: snapshot.data!.length,
                          pagination: const SwiperPagination(alignment: Alignment.center, builder: SwiperPagination.fraction),
                          control: SwiperControl()),
                        );
                      }
                      else{
                        return Column(
                          children: [
                            Icon(Icons.block, color: Colors.red),
                            Text('NO COMIC APPAREANCES', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),),
                          ],
                        );
                      }
                    }else if(snapshot.hasError){
                      return Center(child: Text(snapshot.error.toString()),);
                    }else{
                      return const CircularProgressIndicator(strokeWidth: 2,);
                    }
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10 ,horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('SERIES APPARIENCES: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: FutureBuilder(
                  future: apiMarvel?.getAllEvents(marvelModel.id),
                  builder: (context, AsyncSnapshot<List<MarvelEventModel>?> snapshot ){
                    if(snapshot.hasData){
                      if (snapshot.data!.length > 0){
                        return SizedBox(
                          height: 280,
                          child: RawScrollbar(
                            thumbVisibility: true,
                            thumbColor: Colors.red,
                            child: ResponsiveGridList(
                              rowMainAxisAlignment: MainAxisAlignment.center,
                              horizontalGridMargin: 20,
                              verticalGridMargin: 10,
                              minItemWidth: 100,
                              children: List.generate(
                                snapshot.data!.length,
                                (index) => ItemMarvelEvent(marvelEventModel: snapshot.data![index])
                              ),
                            ),
                          ),
                        );
                      }else{
                        return Column(
                          children: [
                            Icon(Icons.block, color: Colors.red),
                            Text('NO SERIES APPEAREANCES', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),),
                          ],
                        );
                      }
                      
                    }
                    else if(snapshot.hasError){
                      return Center(child: Text(snapshot.error.toString()),);
                    }else{
                      return const CircularProgressIndicator();
                    }
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}