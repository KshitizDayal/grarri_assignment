import 'package:flutter/material.dart';

import '../models/dish_model.dart';

class OrderProvider extends ChangeNotifier {
  static OrderProvider instance = OrderProvider();
  OrderProvider();

  List<DishModel> cartItems = [];
}
