import 'package:flutter/material.dart';
import 'package:practica1/models/post_model.dart';

class PostWidget extends StatelessWidget {
  PostWidget({super.key, this.objPostModel});

  PostModel? objPostModel;

  @override

    final avatar = const CircleAvatar(
      backgroundImage: AssetImage('assets/user_default.jpg'));
    final txtUser = const Text('Edukab');
    final datePost = const Text('06-03-2023');
    final imgPost = const Image(
      image: AssetImage('assets/onBoarding/onBoarding2.png'),
      height: 100);
    final txtDescription = const Text('El primer post de la aplicacion.');
    final iconRate = const Icon(Icons.rate_review);

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          children: [
            Row(
              children: [
                avatar,
                txtUser,
                datePost
              ]
            ),
            Row(
              children: [
                imgPost,
                txtDescription
              ],
            ),
            iconRate
          ],
        ),
      ),
    );
  }
}