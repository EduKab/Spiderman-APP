import 'package:flutter/material.dart';

class ItemActorWidget extends StatelessWidget {
  const ItemActorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/logo_spiderman.jpg')
        ),
        Text('Actor Name')
      ],
    );
  }
}