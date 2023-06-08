import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GithubSignInProvider extends ChangeNotifier {

  Future gitHubLogin(value) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    final credential = GithubAuthProvider.credential(
      value.accessToken
    );

    await auth.signInWithCredential(credential);
  }

  Future githubLogout() async {
    await FirebaseAuth.instance.signOut();
  }
}