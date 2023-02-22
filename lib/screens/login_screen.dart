import 'package:flutter/material.dart';
import 'package:practica1/widgets/loading_modal_widget.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  final txtEmail = const TextField(
    decoration: InputDecoration(
        label: Text("Email User"), border: OutlineInputBorder()),
  );
  final txtPass = const TextField(
    decoration: InputDecoration(
        label: Text("Password User"), border: OutlineInputBorder()),
  );
  final spaceHorizontal = const SizedBox(
    height: 10,
  );

  final btnGoogle = SocialLoginButton(
      buttonType: SocialLoginButtonType.google, onPressed: () {});

  final btnFacebook = SocialLoginButton(
      buttonType: SocialLoginButtonType.facebook, onPressed: () {});

  final btnGitHub = SocialLoginButton(
      buttonType: SocialLoginButtonType.github, onPressed: () {});

  @override
  Widget build(BuildContext context) {
    final btnEmail = SocialLoginButton(
        buttonType: SocialLoginButtonType.generalLogin,
        onPressed: () {
          isLoading = true;
          setState(() {});
          Future.delayed(Duration(milliseconds: 4000)).then((value) {
            isLoading = false;
            setState(() {});
            Navigator.pushNamed(context, '/dash');
          });
        });

    final txtRegister = Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
          child: const Text("Crear cuenta :)",
              style: TextStyle(
                  fontSize: 18, decoration: TextDecoration.underline))),
    );

    final imgLogo = Image.asset(
      'assets/logo_spiderman.png',
      height: 200,
    );

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      opacity: .4,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/fondo_spiderman.jpg'))),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Stack(alignment: Alignment.topCenter, children: [
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                      txtEmail,
                      spaceHorizontal,
                      txtPass,
                      spaceHorizontal,
                      btnEmail,
                      spaceHorizontal,
                      btnGoogle,
                      spaceHorizontal,
                      btnFacebook,
                      spaceHorizontal,
                      btnGitHub,
                      spaceHorizontal,
                      txtRegister
                    ]),
                    Positioned(
                      child: imgLogo,
                      top: 100,
                    )
                  ])),
            ),
            isLoading ? const LoadingModalWidget() : Container()
          ],
        ));
  }
}
