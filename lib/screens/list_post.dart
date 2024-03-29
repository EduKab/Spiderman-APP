import 'package:flutter/material.dart';
import 'package:practica1/database/database_helper.dart';
import 'package:practica1/models/post_model.dart';
import 'package:practica1/provider/flags_provider.dart';
import 'package:practica1/widgets/item_post.dart';
import 'package:provider/provider.dart';

class ListPost extends StatefulWidget {
  const ListPost({super.key});

  @override
  State<ListPost> createState() => _ListPostState();
}

class _ListPostState extends State<ListPost> {
  DatabaseHelper? database;

  @override
  void initState() {
    super.initState();
    database = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {

    FlagsProvider flag = Provider.of<FlagsProvider>(context);

    return FutureBuilder(
      future: flag.getflagListPost() == true ? database!.GetAllPost() : database!.GetAllPost(),
      builder: (context, AsyncSnapshot<List<PostModel>> snapshot) {
        if(snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var objPostModel = snapshot.data![index];
              return ItemPost(objPostModel: objPostModel);
            },
          );
        }else if( snapshot.hasError ){
          return const Center(child: Text('Ocurrio un error :)'),);
        }else{
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
