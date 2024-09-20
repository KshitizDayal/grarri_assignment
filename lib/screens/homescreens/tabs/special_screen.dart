import 'package:flutter/material.dart';
import 'package:grarri_assignment/providers/order_provider.dart';
import 'package:grarri_ds/grarri_ds.dart';
import 'package:provider/provider.dart';

import '../../../providers/dish_provider.dart';

// ignore: must_be_immutable
class SpecialScreen extends StatelessWidget {
  SpecialScreen({super.key});

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
                Container(
                  height: 130,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: DsColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: RadialGradient(
                        center: Alignment.bottomLeft,
                        radius: 4,
                        colors: [
                          const Color(0xFF000000).withOpacity(0.6),
                          const Color(0xFF000000).withOpacity(0.2),
                        ],
                        stops: const [0.25, 0.53],
                      ),
                    ),
                    padding: const EdgeInsets.only(left: 12, bottom: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome to",
                          style:
                              DsFonts.medium16.copyWith(color: DsColors.white),
                        ),
                        Text(
                          "Sunrise Cafe",
                          style:
                              DsFonts.medium16.copyWith(color: DsColors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                CustomExpansionTile(
                    title: "Today's Special",
                    isExpanded: true,
                    children: [
                      GridView.builder(
                        itemCount: _dishProvider.dishData.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8.0,
                          crossAxisSpacing: 8.0,
                          childAspectRatio: 0.8,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          bool addedToCart = _orderProvider.cartItems.any(
                              (element) =>
                                  element.dishId ==
                                  _dishProvider.dishData[index].dishId);
                          return ItemContainerVertical(
                            imageAsset:
                                _dishProvider.dishData[index].dishPicture!,
                            dishName: _dishProvider.dishData[index].dishName!,
                            price:
                                _dishProvider.dishData[index].price.toString(),
                            bottomButton: addedToCart
                                ? CountButton(
                                    increment: () {
                                      _orderProvider.addItemToCart(
                                          _dishProvider.dishData[index]);
                                    },
                                    decrement: () {
                                      _orderProvider.removeItemToCart(
                                          _dishProvider.dishData[index]);
                                    },
                                    count: _orderProvider.cartItems
                                            .firstWhere((element) =>
                                                element.dishId ==
                                                _dishProvider
                                                    .dishData[index].dishId)
                                            .count ??
                                        0)
                                : AddButton(
                                    onTap: () {
                                      _orderProvider.addItemToCart(
                                          _dishProvider.dishData[index]);
                                    },
                                  ),
                          );
                        },
                      ),
                    ]),
              ],
            ),
          ),
        );
      }),
    );
  }
}
