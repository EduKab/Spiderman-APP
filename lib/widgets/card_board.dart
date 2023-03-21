import 'package:flutter/material.dart';

class CardBoardData{
  final String title;
  final String subtitle;
  final ImageProvider image;
  final Color backgroundColor;
  final Color titleColor;
  final Color subtitleColor;
  String background;
  
  CardBoardData({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.backgroundColor,
    required this.titleColor,
    required this.subtitleColor,
    required this.background
  });
}

class CardBoard extends StatelessWidget {
  const CardBoard({required this.data, Key? key}) : super(key: key);

  final CardBoardData data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                const Spacer(flex: 3),
                Flexible(
                  flex: 20,
                  child: Image(image: data.image, height: 350, width: 350)
                ),
                const Spacer(flex: 1),
                Text(
                  data.title.toUpperCase(),
                  style: TextStyle(
                    color: data.titleColor,
                    fontFamily: 'Basketball',
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1
                  ),
                  maxLines: 1
                ),
                const Spacer(flex: 1),
                Text(
                  data.subtitle,
                  style: TextStyle(
                    color: data.subtitleColor,
                    fontSize: 20
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 4
                ),
                const Spacer(flex: 10)
              ],
            ),
          ),
      ],
    );
  }
}