// ignore_for_file: camel_case_types, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class authService {
  final _auth = FirebaseAuth.instance;
  Future<void> emailVerificationLink() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } catch (e) {
      print(e.toString());
    }
  }

  //google sign in
  Future signInWithGoogle() async {
    //beginning of google sign in

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    //obtain new details

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    //create new credentials
    final currentUserData = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    //finally lets sign in
    return FirebaseAuth.instance.signInWithCredential(currentUserData);
  }
}
