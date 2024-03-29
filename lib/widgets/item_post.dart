import 'package:flutter/material.dart';
import 'package:practica1/models/post_model.dart';
import 'package:provider/provider.dart';

import '../database/database_helper.dart';
import '../provider/flags_provider.dart';

class ItemPost extends StatelessWidget {
  ItemPost({super.key, this.objPostModel});

  PostModel? objPostModel;
  DatabaseHelper database = DatabaseHelper();

  @override
  Widget build(BuildContext context) {

    const avatar = CircleAvatar(
      backgroundImage: AssetImage('assets/user_default.jpg'));
    const txtUser = Text('Edukab');
    const datePost = Text('06-03-2023');
    const imgPost = Image(
      image: AssetImage('assets/onBoarding/onBoarding2.png'),
      height: 100);
    final txtDescription = Text(objPostModel!.descripcion!);
    const iconRate = Icon(Icons.rate_review);

    FlagsProvider flag = Provider.of<FlagsProvider>(context);
    
     return Container(
      margin: const EdgeInsets.all(10),
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          const Row(
            children: [
              avatar,
              txtUser,
              datePost
            ],
          ),
          Row(
            children: [
              imgPost,
              txtDescription
            ],
          ),
          Row(
            children: [
              iconRate,
              Expanded(child: Container()),
              IconButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/add_post', arguments: objPostModel);
                }, 
                icon: const Icon(Icons.edit)
              ),
              IconButton(
                onPressed: (){
                  showDialog(
                    context: context, 
                    builder: (context) => AlertDialog(
                      title: const Text('Confirmar Borrado'),
                      content: const Text('Deseas borrar el post?'),
                      actions: [
                        TextButton(
                          onPressed: (){
                            database.DELETE('tblPost',objPostModel!.idPost!).then(
                              (value) => flag.setflagListPost()
                            );
                            Navigator.pop(context);
                          }, 
                          child: const Text('Si')
                        ),
                        TextButton(
                          onPressed: (){}, 
                          child: const Text('No')
                        )
                      ],
                    ),
                  );
                }, 
                icon: const Icon(Icons.delete)
              )
            ],
          )
        ],
      ),
    );
  }
}