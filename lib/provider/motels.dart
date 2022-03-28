import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:travel_hotel_app/models/hotel_model.dart';

class MotelProvider with  ChangeNotifier, DiagnosticableTreeMixin {
  late List<Motel> favoriteMotelList = [];
  late List<Motel> motelList = hotels;
  late String currentFormality = '';

  void initialise() {
    favoriteMotelList = [];
    motelList = hotels;
    currentFormality = '';
    notifyListeners();
  }

  void toggleFavoriteMotel(Motel targetMotel) {
    var foundMotel = favoriteMotelList.where((motel) => motel.id == targetMotel.id);
    if (foundMotel.isEmpty) {
      favoriteMotelList.add(targetMotel);
      notifyListeners();
    } else {
      favoriteMotelList.removeWhere((motel) => motel.id == targetMotel.id);
      notifyListeners();
    };
  }

  void setTargetCategory(String categoryName) {
    if (categoryName == 'Tất cả') {
      initialise();
    } else {
      motelList = hotels;
      final foundMotel = motelList.where((motel) => motel.address.contains(categoryName) == true
          && motel.formality.contains(currentFormality)
      ).toList();
      motelList = foundMotel;
      notifyListeners();
    }
  }

  void searchMotel(String search) {
    if (search == '') {
      motelList = hotels;
    } else {
      final foundMotel = motelList.where((motel) =>
          motel.name.toLowerCase().contains(search.toLowerCase()) ||
          motel.address.toLowerCase().contains(search.toLowerCase())
      ).toList();
      motelList = foundMotel;
    }
    currentFormality = '';
    notifyListeners();
  }

  void filterFormality(String targetFormality) {
    motelList = hotels;
    currentFormality = targetFormality;
    final foundMotel = motelList.where((motel) => motel.formality.compareTo(targetFormality) == 0).toList();
    motelList = foundMotel;
    notifyListeners();
  }

  List<Motel> getMotelList() {
    return motelList;
  }

  List<Motel> getFavoritedMotelList() {
    return favoriteMotelList;
  }
}