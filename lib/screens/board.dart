import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:practica1/screens/login_screen.dart';
import 'package:practica1/widgets/card_board.dart';

class Board extends StatelessWidget {
  Board({Key? key}) : super(key: key);

  final data = [
    CardBoardData(
      title: "Collection",
      subtitle: "The new app for Hot Wheels collection for all people",
      image: const AssetImage("assets/onBoarding/onBoarding1.png"),
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      titleColor: Color.fromARGB(255, 255, 255, 255),
      subtitleColor: Color.fromARGB(255, 130, 0, 0),
      background: LottieBuilder.asset('assets/animations/onBoarding1.json')
    ),
    const CardBoardData(
      title: "Cars",
      subtitle: "Find all Hot Wheels Car to add in your collection.",
      image: AssetImage("assets/onBoarding/onBoarding2.png"),
      backgroundColor: Color.fromRGBO(113, 113, 113, 1),
      titleColor: Colors.red,
      subtitleColor: Colors.white
    ),
    const CardBoardData(
      title: "Hot wheels",
      subtitle: "The best toy cars.",
      image: AssetImage("assets/onBoarding/onBoarding3.png"),
      backgroundColor: Color.fromRGBO(23, 4, 111, 1),
      titleColor: Color.fromARGB(255, 255, 17, 1),
      subtitleColor: Colors.white
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