import 'package:flutter/material.dart';
import '../models/marvel_character_model.dart';
import '../network/api_marvel.dart';
import '../responsive.dart';
import '../widgets/item_marvel_character.dart';

class ListMarvelCharacters extends StatefulWidget {
  const ListMarvelCharacters({super.key});

  @override
  State<ListMarvelCharacters> createState() => _ListMarvelCharactersState();
}

class _ListMarvelCharactersState extends State<ListMarvelCharacters> {

  ApiMarvel? apiMarvel;

  @override
  void initState() {
    super.initState();
    apiMarvel = ApiMarvel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Marvel Characters'),),
      body: Responsive(
        mobile: MobileListMarvelCharacterScreen(),
        desktop: DesktopListMarvelCharacterScreen(),
      ),
    );
  }
}

class DesktopListMarvelCharacterScreen extends StatelessWidget {
  DesktopListMarvelCharacterScreen({super.key});

  ApiMarvel apiMarvel = ApiMarvel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiMarvel!.getAllCharacters(),
      builder: (context, AsyncSnapshot<List<MarvelModel>?> snapshot ) {
        if( snapshot.hasData ){
          return GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.53,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0
            ), 
            itemCount: snapshot.data != null ? snapshot.data!.length : 0,
            itemBuilder: (context, index) {
              return ItemMarvelCharacter(marvelModel: snapshot.data![index]);
            },
          );
        }else if( snapshot.hasError){
          return Center(child: Text(snapshot.error.toString()),);
        }else{
          return const CircularProgressIndicator();
        }
      }
    );
  }
}

class MobileListMarvelCharacterScreen extends StatelessWidget {
  MobileListMarvelCharacterScreen({super.key});

  ApiMarvel apiMarvel = ApiMarvel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiMarvel!.getAllCharacters(),
      builder: (context, AsyncSnapshot<List<MarvelModel>?> snapshot ) {
        if( snapshot.hasData ){
          return GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.53,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0
            ), 
            itemCount: snapshot.data != null ? snapshot.data!.length : 0,
            itemBuilder: (context, index) {
              return ItemMarvelCharacter(marvelModel: snapshot.data![index]);
            },
          );
        }else if( snapshot.hasError){
          return Center(child: Text(snapshot.error.toString()),);
        }else{
          return const CircularProgressIndicator();
        }
      }
    );
  }
}