import 'package:flutter/material.dart';
import 'package:grarri_assignment/models/dish_model.dart';

import '../jsondata.dart';

class DishProvider extends ChangeNotifier {
  static DishProvider instance = DishProvider();
  DishProvider();

  List<DishModel> dishData = [];

  void fetchDishData() {
    dishData = dishFromJson(jsonDishData);
    notifyListeners();
  }
}
