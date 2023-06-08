import 'package:flutter/material.dart';
import 'package:github_signin_promax/github_signin_promax.dart';
import 'package:practica1/responsive.dart';
import 'package:practica1/screens/dashboard_screen.dart';
import 'package:practica1/widgets/loading_modal_widget.dart';
import 'package:provider/provider.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'dart:ui' as ui;

import '../provider/github_sign_in_provider.dart';
import '../provider/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  var params = GithubSignInParams(
        clientId: 'a0c9efb3b52d632bed90',
        clientSecret: 'bd7ab105c36dad31ce38eb641df347e8ac9290d0',
        redirectUrl: 'https://spiderman-app-auth.firebaseapp.com/__/auth/handler',
        scopes: 'read:user,user:email',
  );

  final txtEmail = const TextField(
      decoration:
          InputDecoration(label: Text("Email"), border: OutlineInputBorder()));
  final txtPass = const TextField(
    decoration: InputDecoration(
        label: Text("Password"),
        border:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
  );
  final spaceHorizontal = const SizedBox(
    height: 10,
  );
  final spaceBottomLogo = const SizedBox(
    height: 30,
  );

  final btnFacebook = SocialLoginButton(
      buttonType: SocialLoginButtonType.facebook, onPressed: () {});

  @override
  Widget build(BuildContext context) {

    final btnEmail = SocialLoginButton(
        buttonType: SocialLoginButtonType.generalLogin,
        onPressed: () {
          isLoading = true;
          setState(() {});
          Future.delayed(const Duration(milliseconds: 4000)).then((value) {
            isLoading = false;
            setState(() {});
            //Navigator.pushNamedAndRemoveUntil(context, '/dash', ((route) => false));
          });
        });

    final btnGoogle = SocialLoginButton(
      buttonType: SocialLoginButtonType.google, 
      onPressed: () async {
        final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
        await provider.googleLogin();
        Navigator.pushNamedAndRemoveUntil(context, '/dash', ((route) => false));
      }
    );

    final btnGitHub = SocialLoginButton(
      buttonType: SocialLoginButtonType.github, 
      onPressed: () {
        // Push [GithubSigninScreen] to perform login then get the [GithubSignInResponse]
        Navigator.of(context).push(MaterialPageRoute(builder: (builder) {
          return GithubSigninScreen(
            params: params,
            headerColor: Colors.green,
            title: 'Login with github',
          );
        })).then((value) async {
          final provider = Provider.of<GithubSignInProvider>(context, listen: false);
          await provider.gitHubLogin(value);      
          Navigator.pushNamedAndRemoveUntil(context, '/dash', ((route) => false));     
        });
      }
    );

    final txtRegister = Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
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
      height: 250,
    );

    final imgLogoWeb = Image.asset(
      'assets/logo_spiderman.png',
      height: 350,
    );

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Responsive(
              mobile: MobileLoginScreen(
                  txtEmail: txtEmail,
                  spaceHorizontal: spaceHorizontal,
                  spaceBottomLogo: spaceBottomLogo,
                  txtPass: txtPass,
                  btnEmail: btnEmail,
                  btnGoogle: btnGoogle,
                  btnFacebook: btnFacebook,
                  btnGitHub: btnGitHub,
                  txtRegister: txtRegister,
                  imgLogo: imgLogo),
              desktop: DesktopLoginScreen(
                  imgLogoWeb: imgLogoWeb,
                  txtEmail: txtEmail,
                  spaceHorizontal: spaceHorizontal,
                  txtPass: txtPass,
                  btnEmail: btnEmail,
                  btnGoogle: btnGoogle,
                  btnFacebook: btnFacebook,
                  btnGitHub: btnGitHub,
                  txtRegister: txtRegister),
            ),
            isLoading ? const LoadingModalWidget() : Container()
          ],
        ));
  }
}

class DesktopLoginScreen extends StatelessWidget {
  const DesktopLoginScreen({
    Key? key,
    required this.imgLogoWeb,
    required this.txtEmail,
    required this.spaceHorizontal,
    required this.txtPass,
    required this.btnEmail,
    required this.btnGoogle,
    required this.btnFacebook,
    required this.btnGitHub,
    required this.txtRegister,
  }) : super(key: key);

  final Image imgLogoWeb;
  final TextField txtEmail;
  final SizedBox spaceHorizontal;
  final TextField txtPass;
  final SocialLoginButton btnEmail;
  final SocialLoginButton btnGoogle;
  final SocialLoginButton btnFacebook;
  final SocialLoginButton btnGitHub;
  final Padding txtRegister;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              opacity: .4,
              fit: BoxFit.cover,
              image: AssetImage('assets/fondo_spiderman.jpg'))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          children: [
            Expanded(
                child: Stack(alignment: Alignment.topCenter, children: [
              Positioned(
                top: 100,
                child: imgLogoWeb,
              )
            ])),
            Expanded(
                child: ClipRect(
                  child: 
                    Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                    SizedBox(
                        width: 450,
                        child: Stack(alignment: Alignment.topCenter, children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
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
                        ])),
              ],
            ),
                  
                ))
          ],
        ),
      ),
    );
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    Key? key,
    required this.txtEmail,
    required this.spaceHorizontal,
    required this.spaceBottomLogo,
    required this.txtPass,
    required this.btnEmail,
    required this.btnGoogle,
    required this.btnFacebook,
    required this.btnGitHub,
    required this.txtRegister,
    required this.imgLogo,
  }) : super(key: key);

  final TextField txtEmail;
  final SizedBox spaceHorizontal;
  final SizedBox spaceBottomLogo;
  final TextField txtPass;
  final SocialLoginButton btnEmail;
  final SocialLoginButton btnGoogle;
  final SocialLoginButton btnFacebook;
  final SocialLoginButton btnGitHub;
  final Padding txtRegister;
  final Image imgLogo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  opacity: .4,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/fondo_spiderman.jpg')))),
          Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top:40),
              child: SingleChildScrollView(
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/logo_spiderman.png', height: 250),
                    ],
                  ),
                  spaceBottomLogo,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ui.ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                      ),
                    ),
                  ),
                ]),
              )),
      ],
    );
  }
}
