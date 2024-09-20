import 'package:flutter/material.dart';
import 'package:grarri_assignment/providers/dish_provider.dart';
import 'package:grarri_ds/grarri_ds.dart';
import 'package:provider/provider.dart';

import '../../../providers/order_provider.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  late DishProvider _dishProvider;
  late OrderProvider _orderProvider;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: DishProvider.instance),
        ChangeNotifierProvider.value(value: OrderProvider.instance),
      ],
      child: Builder(builder: (BuildContext providerContext) {
        _dishProvider = Provider.of<DishProvider>(providerContext);
        _orderProvider = Provider.of<OrderProvider>(providerContext);

        return Container(
          margin: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomExpansionTile(
                  title: "Choclate Bowls",
                  isExpanded: true,
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _dishProvider.dishData
                            .where((dish) => dish.category == "Choclate")
                            .length,
                        itemBuilder: (context, index) {
                          var filteredDishData = _dishProvider.dishData
                              .where((dish) => dish.category == "Choclate")
                              .toList();

                          bool addedToCart = _orderProvider.cartItems.any(
                              (element) =>
                                  element.dishId ==
                                  filteredDishData[index].dishId);
                          return ItemContainerHorizontal(
                            imageAsset: filteredDishData[index].dishPicture!,
                            dishName: filteredDishData[index].dishName!,
                            price: filteredDishData[index].price.toString(),
                            bottomButton: addedToCart
                                ? CountButton(
                                    increment: () {
                                      _orderProvider.addItemToCart(
                                          filteredDishData[index]);
                                    },
                                    decrement: () {
                                      _orderProvider.removeItemToCart(
                                          filteredDishData[index]);
                                    },
                                    count: _orderProvider.cartItems
                                            .firstWhere((element) =>
                                                element.dishId ==
                                                filteredDishData[index].dishId)
                                            .count ??
                                        0)
                                : AddButton(
                                    onTap: () {
                                      _orderProvider.addItemToCart(
                                          filteredDishData[index]);
                                    },
                                  ),
                          );
                        })
                  ],
                ),
                const SizedBox(height: 12),
                CustomExpansionTile(
                  title: "Fruit Bowls",
                  isExpanded: true,
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _dishProvider.dishData
                            .where((dish) => dish.category == "Fruit")
                            .length,
                        itemBuilder: (context, index) {
                          var filteredDishData = _dishProvider.dishData
                              .where((dish) => dish.category == "Fruit")
                              .toList();
                          bool addedToCart = _orderProvider.cartItems.any(
                              (element) =>
                                  element.dishId ==
                                  filteredDishData[index].dishId);
                          return ItemContainerHorizontal(
                            imageAsset: filteredDishData[index].dishPicture!,
                            dishName: filteredDishData[index].dishName!,
                            price: filteredDishData[index].price.toString(),
                            bottomButton: addedToCart
                                ? CountButton(
                                    increment: () {
                                      _orderProvider.addItemToCart(
                                          filteredDishData[index]);
                                    },
                                    decrement: () {
                                      _orderProvider.removeItemToCart(
                                          filteredDishData[index]);
                                    },
                                    count: _orderProvider.cartItems
                                            .firstWhere((element) =>
                                                element.dishId ==
                                                filteredDishData[index].dishId)
                                            .count ??
                                        0)
                                : AddButton(
                                    onTap: () {
                                      _orderProvider.addItemToCart(
                                          filteredDishData[index]);
                                    },
                                  ),
                          );
                        })
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
