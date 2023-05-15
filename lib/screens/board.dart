import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:practica1/screens/login_screen.dart';
import 'package:practica1/widgets/card_board.dart';

class Board extends StatelessWidget {
  Board({Key? key}) : super(key: key);

  final data = [
    CardBoardData(
      title: "WELCOME",
      subtitle: "The new app for Spiderman fans for chating, sharing and meet people with same likes and dislikes from our friendly friend Spiderman. :)",
      image: const AssetImage("assets/onBoarding/onBoarding1.png"),
      backgroundColor: const Color.fromARGB(255, 17, 17, 17),
      titleColor: const Color.fromARGB(255, 255, 255, 255),
      subtitleColor: const Color.fromARGB(255, 130, 0, 0),
      //background: LottieBuilder.asset('assets/animations/onBoarding1.json')
      background: 'assets/onBoarding/fondo1.jpg'
    ),
    CardBoardData(
      title: "CHAT",
      subtitle: "Chating with your friends or another people of other countrys around the world.",
      image: const AssetImage("assets/onBoarding/onBoarding2.png"),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      titleColor: const Color.fromARGB(255, 25, 20, 173),
      subtitleColor: const Color.fromARGB(255, 0, 0, 0),
      background: 'assets/onBoarding/fondo2.jpg'
    ),
    CardBoardData(
      title: "SHARE MEDIA",
      subtitle: "Share all media that you want, photos, questions, experiences, jokes. The community always connected.",
      image: const AssetImage("assets/onBoarding/onBoarding3.png"),
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      titleColor: const Color.fromARGB(255, 255, 17, 1),
      subtitleColor: Colors.white,
      background: 'assets/onBoarding/fondo3.jpg'
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        colors: data.map((e) => e.backgroundColor).toList(),
        itemCount: data.length,
        itemBuilder: (int index) {
          return CardBoard(data: data[index]);
        },
        onFinish: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        },
      ),
    );
  }
}