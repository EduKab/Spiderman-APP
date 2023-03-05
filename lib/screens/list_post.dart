import 'package:flutter/material.dart';
import 'package:practica1/database/database_helper.dart';
import 'package:practica1/models/post_model.dart';

class ListPost extends StatefulWidget {
  const ListPost({super.key});

  @override
  State<ListPost> createState() => _ListPostState();
}

class _ListPostState extends State<ListPost> {
  DatabaseHelper? databaseHelper;

  @override
  void initState() {
    super.initState();
    databaseHelper = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        //future: databaseHelper!.GETALLPOST(),
        //  Hay que especificar el tipo de dato que recibiremos en snapshot para poder ingresar a los
        //  atributos del elemento que recuperemos.
        builder: (context, AsyncSnapshot<List<PostModel>> snapshot) {
      //  En este bloque se coloca las condiciones o ciclos que necesitemos.
      if (snapshot.hasData) {
        //Widget cuando ya encontro los datos.
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
          var objPostModel = snapshot.data![index];
          return Container();
        });
      } else if (snapshot.hasError) {
        //Widget cuando sucedio un error.
        return const Center(child: Text('Ocurrio un error :()'));
      } else {
        //Wideget cuando todavia esta buscando los datos, osea cargando.
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
