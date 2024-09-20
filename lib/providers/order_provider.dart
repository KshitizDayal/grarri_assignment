import 'package:flutter/material.dart';

import '../models/dish_model.dart';

class OrderProvider extends ChangeNotifier {
  static OrderProvider instance = OrderProvider();
  OrderProvider();

  List<DishModel> cartItems = [];

  List<DishModel> previouOrderItems = [];

  int cartQuantity = 0;

  void addItemToCart(DishModel dishData) {
    if (cartItems.any((element) => element.dishId == dishData.dishId)) {
      DishModel particularDish =
          cartItems.firstWhere((item) => item.dishId == dishData.dishId);
      if (particularDish.count != null) {
        particularDish.count = particularDish.count! + 1;
      } else {
        particularDish.count = 1;
      }
    } else {
      cartItems.add(dishData);
    }
    cartQuantity += 1;
    notifyListeners();
  }

  void removeItemToCart(DishModel dishData) {
    DishModel particularDish =
        cartItems.firstWhere((item) => item.dishId == dishData.dishId);

    if (particularDish.count == 1) {
      cartItems.removeWhere((element) => element.dishId == dishData.dishId);
    } else {
      particularDish.count = particularDish.count! - 1;
    }
    cartQuantity -= 1;
    notifyListeners();
  }

  void completeOrders() {
    previouOrderItems.addAll(cartItems);
    cartQuantity = 0;
    cartItems = [];
    notifyListeners();

    print(previouOrderItems);
  }
}
