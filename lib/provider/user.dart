import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:travel_hotel_app/models/user_model.dart';

class UserProvider with ChangeNotifier, DiagnosticableTreeMixin {
  late User currentUser;

  void login(User user){
    currentUser = user;
    notifyListeners();
  }

  // void logout() {
  //   currentUser = null;
  //   notifyListeners();
  // }

  User getCurrentUser() {
    return currentUser;
  }
}