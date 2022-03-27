
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travel_hotel_app/models/user_model.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future<GoogleSignInAccount?> googleLogin() async {
    print("in google login function");
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return null;
    _user = googleUser;
    print("type of _user is ${_user.runtimeType}");

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );
    print("credential is $credential");

    await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();
    return _user;
  }

  Future logout () async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}