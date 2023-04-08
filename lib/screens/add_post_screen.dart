import 'package:flutter/material.dart';
import 'package:practica1/database/database_helper.dart';
import 'package:provider/provider.dart';

import '../models/post_model.dart';
import '../provider/flags_provider.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({super.key});

  DatabaseHelper database = DatabaseHelper();
  PostModel? objPosmodel;

  @override
  Widget build(BuildContext context) {
    
    FlagsProvider flag = Provider.of<FlagsProvider>(context);
    final txtContPost = TextEditingController();

    if( ModalRoute.of(context)!.settings.arguments != null ){
      objPosmodel = ModalRoute.of(context)!.settings.arguments as PostModel;
      txtContPost.text = objPosmodel!.descripcion!;
    }

    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(15),
          height: 350,
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(color: Colors.black)
          ),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              objPosmodel == null 
                ? const Text('Add Post :)') 
                : const Text('Update Post :)'),
              TextFormField(
                controller: txtContPost,
                maxLines: 8
              ),
              ElevatedButton(
                onPressed: (){
                  if( objPosmodel == null ){
                    database.INSERT('tblPost',{
                      'dscPost' : txtContPost.text,
                      'datePost' : DateTime.now().toString()
                    }).then((value){
                      var msg = value > 0 
                        ? 'Register Insert'
                        : 'Register Error';

                      var snackBar = SnackBar(content: Text(msg));
                    
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    });
                  }else{
                    database.UPDATE('tblPost',{
                      'idPost' : objPosmodel!.idPost,
                      'dscPost' : txtContPost.text,
                      'datePost' : DateTime.now().toString()
                    }).then((value){

                      var msg = value > 0 
                        ? 'Registro actualizado' 
                        : 'Ocurrió un error';

                      var snackBar = SnackBar(
                        content: Text(msg)
                      );

                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    });
                  }
                  flag.setflagListPost();
                }, 
                child: const Text('Save Post'))
            ],
          ),
        ),
      ),
    );
  }
}