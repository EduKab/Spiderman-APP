import 'package:flutter/material.dart';
import 'package:practica1/database/database_helper.dart';


class FavoriteWidget extends StatefulWidget {
  int id; 
  String title;
  String poster_path;

  bool favorite = false;

  FavoriteWidget(this.id, this.title, this.poster_path, {super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  
  DatabaseHelper database = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    getFavorite();

    return IconButton(
      onPressed: (){
        widget.favorite = !widget.favorite;
        if (widget.favorite){
          database.INSERT('tblFavMovie', {'idMovie':widget.id, 'titleMovie':widget.title, 'poster_path': widget.poster_path});
          print('favoritos:');
          print(database.getAllFavorite().toString());
        }else{
          database.deleteFavMovie('tblFavMovie', widget.id);
          print('favoritos eliminado:');
          print(database.getAllFavorite());
        }
        setState(() {});
      }, 
      icon: widget.favorite
        ?const Icon(Icons.favorite, color: Colors.red, size: 30)
        :const Icon(Icons.favorite_border, color: Colors.red, size: 30)
      );
  }

  getFavorite() async {
      widget.favorite = await database.getFavorite(widget.id);
      setState(() {
        
      });
  }
}