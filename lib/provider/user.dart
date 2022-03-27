import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:travel_hotel_app/models/user_model.dart';

class UserProvider with ChangeNotifier, DiagnosticableTreeMixin {
  late User currentUser = User();

  void initialise() {
    notifyListeners();
  }

  // this function is hard code in loginScreen
  void loginWithFacebook() async {
    final result = await FacebookAuth.i.login(
        permissions: ["public_profile", "email"]
    );
    if (result.status == LoginStatus.success){
      await FacebookAuth.i.getUserData(
          fields: "email, name"
      ).then((value) {
        currentUser = User(id: value['id'], email: value['email'], fullName: value['name']);
        notifyListeners();
      });
    }
  }

  void facebookLogout() async {
    await FacebookAuth.i.logOut();
    currentUser = User(id: '', email: '', fullName: '');
    notifyListeners();
  }

  void login(User user) {
    currentUser = user;
    notifyListeners();
  }

  void logout() {
    currentUser = User(id: '', email: '', fullName: '');
    notifyListeners();
  }

  User getCurrentUser() {
    return currentUser;
  }
}