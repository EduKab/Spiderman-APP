
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:practica1/models/marvel_character_model.dart';
import 'package:practica1/screens/details_marvel_character.dart';

class ItemMarvelCharacter extends StatelessWidget {
  const ItemMarvelCharacter({super.key, required this.marvelModel});

  final MarvelModel marvelModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), 
                color: const Color.fromRGBO(231, 235, 240, 94)
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: FadeInImage(
                              width: 179,
                              height: 179,
                              fit: BoxFit.fill,
                              placeholder: const AssetImage('assets/loading.gif'), 
                              image: NetworkImage(
                                marvelModel.thumbnail_path != null
                                ? '${marvelModel.thumbnail_path}' '.${marvelModel.thumbnail_extension}'
                                : 'https://i0.wp.com/www.repol.copl.ulaval.ca/wp-content/uploads/2019/01/default-user-icon.jpg?fit=300%2C300'
                              ),
                            ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        '${marvelModel.name}'.toUpperCase(), 
                        style: const TextStyle(fontFamily: 'Rowdies-Regular'), 
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Row(
                        children: [
                          Flexible(
                            child: Column(
                              children: [
                                marvelModel.description != ''
                                ? Text(
                                    '${marvelModel.description}',
                                    maxLines: 3, 
                                    textAlign: TextAlign.justify,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                : const Text(
                                    'DESCRIPTION NO AVAILABLE :(\n', 
                                    maxLines: 3, 
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                  )
                              ],
                            )
                          ),
                          
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: TextButton(
                        onPressed: (){
                          print('Marvel ID: ');
                          print(marvelModel.id);
                          Navigator.push(context, PageTransition(duration: const Duration(milliseconds: 300), type: PageTransitionType.leftToRight, child: DetailsMarvelCharacter(marvelModel: marvelModel)));
                        },
                        style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black87), elevation: MaterialStatePropertyAll(1)), 
                        child: const Text('MORE DETAILS'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsMovie(id: popularModel.id!, title: popularModel.originalTitle, raiting: popularModel.voteAverage, description: popularModel.overview, release_date: popularModel.releaseDate, poster_path: popularModel.posterPath)));
      },
    );
  }
}