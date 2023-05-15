import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:practica1/models/credit_popular_model.dart';
import 'package:practica1/network/api_popular.dart';
import 'package:practica1/widgets/favorite_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../database/database_helper.dart';
import '../models/video_popular_model.dart';

class DetailsMovie extends StatelessWidget {
  DetailsMovie({super.key, required this.id, required this.title, required this.raiting, required this.description, required this.release_date, required this.poster_path});

  final int id;
  final String? title, description, release_date, poster_path;
  final double? raiting;

  ApiPopular? apiPopular = ApiPopular();

  @override
  Widget build(BuildContext context) {

    print(id);
    DatabaseHelper database = DatabaseHelper();
    Future<bool> result = database.getFavorite(id);
    bool isFavorite;
    print(result);

    if(result != []){
      print('falso');
      isFavorite = false;
    }else{
      print('verdadero');
      isFavorite = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Movie'),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://image.tmdb.org/t/p/w500/${poster_path!}'),
              fit: BoxFit.fill,
              opacity: .2
            )
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FavoriteWidget(id, title!, isFavorite, poster_path!)
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(title!, style: const TextStyle(fontFamily: 'Basketball', fontSize: 30))
                        ]
                      ),
                    )
                  ],
                )
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network('https://image.tmdb.org/t/p/w500/${poster_path!}', height: 300, width: 300,)
                  ],
                ),
              ),
              RatingBar.builder(
                initialRating: (raiting! * .5),
                ignoreGestures: true,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 30,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star_rate_sharp,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              Text('Raiting: ${raiting!}', style: const TextStyle(fontWeight: FontWeight.bold)),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child:  Row(
                  children: [
                    Text('Description: ', style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child:  Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(description!, textAlign: TextAlign.justify)
                            ]
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:  Row(
                  children: [
                    const Text('Date Release: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(release_date!)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FutureBuilder(
                    future: apiPopular!.getVideos(id),
                    builder: (context, AsyncSnapshot<List<VideoPopularModel>?> snapshot ) {
                      if( snapshot.hasData ){
                        return SizedBox(
                          height: 250,
                          width: 350,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index){
                              return YoutubePlayer(
                                width: 350,
                                controller: YoutubePlayerController(
                                  initialVideoId: snapshot.data![index].key,
                                  flags: const YoutubePlayerFlags(
                                    autoPlay: false,
                                    mute: false,
                                  ),  
                                ),
                                showVideoProgressIndicator: true,
                                progressColors: const ProgressBarColors(
                                    playedColor: Colors.amber,
                                    handleColor: Colors.amberAccent,
                                ),
                              );
                            }, 
                            separatorBuilder: (_, __) => const SizedBox(width: 10), 
                            itemCount: snapshot.data!.length),
                        );
                      }else if( snapshot.hasError){
                        return const Center(child: Text('Ocurrio un error :()'),);
                      }else{
                        return const CircularProgressIndicator();
                      }
                    }
                  )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child:  Row(
                  children: [
                    Text('Credits:', style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FutureBuilder(
                    future: apiPopular!.getCredits(id),
                    builder: (context, AsyncSnapshot<List<CreditPopularModel>?> snapshot ) {
                      if(snapshot.hasData){
                        return SizedBox(
                          height: 100,
                          width: 350,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index){
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: snapshot.data![index].profile_path != null
                                        ? NetworkImage('https://image.tmdb.org/t/p/w500${snapshot.data![index].profile_path}')
                                        : const NetworkImage('https://th.bing.com/th/id/R.653f93c3cb58cb7f21b6a721ebdbec19?rik=wJggWmq6sjoy5w&riu=http%3a%2f%2fwww.4x4.ec%2foverlandecuador%2fwp-content%2fuploads%2f2017%2f06%2fdefault-user-icon-8.jpg&ehk=9fyAmt1RIymhvMctzqJXJMDodZfLHOkhYLUAIoBLYfs%3d&risl=&pid=ImgRaw&r=0')
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text('Name: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                      Text(snapshot.data![index].original_name)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text('Character: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                      Text(snapshot.data![index].character)
                                    ],
                                  )
                                ],
                              );
                            }, 
                            separatorBuilder: (_, __) => const SizedBox(width: 10), 
                            itemCount: snapshot.data!.length),
                        );
                      }else if( snapshot.hasError){
                        return const Center(child: Text('Ocurrio un error :()'),);
                      }else{
                        return const CircularProgressIndicator();
                      }
                    }
                  )
                  ],
                ),
              ),
              /*const Padding(
                padding: EdgeInsets.all(10),
                child: ListActor(),
              )*/
            ],
          ),
        ),
      ),
    );
  }
}