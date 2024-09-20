import 'package:flutter/material.dart';
import 'package:grarri_assignment/screens/bottom_navigation_screen.dart';
import 'package:grarri_ds/grarri_ds.dart';
import 'package:provider/provider.dart';

import '../../providers/order_provider.dart';

// ignore: must_be_immutable
class PlaceOrderScreen extends StatelessWidget {
  PlaceOrderScreen({super.key});

  late OrderProvider _orderProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        shadowColor: DsColors.colorF1F1F1,
        backgroundColor: DsColors.colorF1F1F1,
        leading: Container(
          margin: const EdgeInsets.only(left: 4),
          child: AppBarIcons(
            icon: const Icon(Icons.arrow_back),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Text(
          "Place Order",
          style: DsFonts.bold18.copyWith(color: DsColors.color4A5662),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        actions: [
          AppBarIcons(
            icon: const Icon(
              Icons.feedback,
              color: Color(0xFFF4B740),
            ),
            onTap: () {},
          ),
          const SizedBox(width: 16),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: SizedBox(),
        ),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: OrderProvider.instance),
        ],
        child: Builder(builder: (BuildContext providerContext) {
          _orderProvider = Provider.of<OrderProvider>(providerContext);

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: DsColors.colorF1F1F1,
                        child: CustomExpansionTile(
                          title: "Current Order",
                          isExpanded: true,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: DsColors.black.withOpacity(0.08),
                                  ),
                                  const BoxShadow(
                                      color: DsColors.white,
                                      spreadRadius: -1.0,
                                      blurRadius: 10,
                                      offset: Offset(4, 4)),
                                ],
                              ),
                              child: ListView.builder(
                                itemCount: _orderProvider.cartItems.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return CartItems(
                                    isOrderPlaced: false,
                                    dishName: _orderProvider
                                            .cartItems[index].dishName ??
                                        "",
                                    price:
                                        _orderProvider.cartItems[index].price ??
                                            0,
                                    quantity:
                                        _orderProvider.cartItems[index].count ??
                                            0,
                                    bottomWidget: CountButton(
                                        increment: () {
                                          _orderProvider.addItemToCart(
                                              _orderProvider.cartItems[index]);
                                        },
                                        decrement: () {
                                          _orderProvider.removeItemToCart(
                                              _orderProvider.cartItems[index]);
                                        },
                                        count: _orderProvider.cartItems
                                                .firstWhere((element) =>
                                                    element.dishId ==
                                                    _orderProvider
                                                        .cartItems[index]
                                                        .dishId)
                                                .count ??
                                            0),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: DsColors.colorF1F1F1,
                        child: CustomExpansionTile(
                          title: "Previous Order",
                          isExpanded: false,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: DsColors.black.withOpacity(0.08),
                                  ),
                                  const BoxShadow(
                                      color: DsColors.white,
                                      spreadRadius: -1.0,
                                      blurRadius: 10,
                                      offset: Offset(4, 4)),
                                ],
                              ),
                              child: ListView.builder(
                                itemCount:
                                    _orderProvider.previouOrderItems.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return CartItems(
                                    isOrderPlaced: true,
                                    dishName: _orderProvider
                                            .previouOrderItems[index]
                                            .dishName ??
                                        "",
                                    price: _orderProvider
                                            .previouOrderItems[index].price ??
                                        0,
                                    quantity: _orderProvider
                                            .previouOrderItems[index].count ??
                                        0,
                                    bottomWidget: CountButton(
                                        increment: () {
                                          _orderProvider.addItemToCart(
                                              _orderProvider
                                                  .previouOrderItems[index]);
                                        },
                                        decrement: () {
                                          _orderProvider.removeItemToCart(
                                              _orderProvider
                                                  .previouOrderItems[index]);
                                        },
                                        count: _orderProvider.previouOrderItems
                                                .firstWhere((element) =>
                                                    element.dishId ==
                                                    _orderProvider
                                                        .previouOrderItems[
                                                            index]
                                                        .dishId)
                                                .count ??
                                            0),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                OrderPlacingButton(
                  itemQuantity: _orderProvider.cartQuantity.toString(),
                  placeOrder: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: DsColors.white,
                            content: const Text(
                              "Are you sure you want to place the order?",
                              style: DsFonts.medium16,
                            ),
                            actions: [
                              InkWell(
                                onTap: () {
                                  _orderProvider.completeOrders();

                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const BottomNavigationScreen()),
                                      (Route<dynamic> route) => false);
                                },
                                child: const Text(
                                  "Yes",
                                  style: DsFonts.bold16,
                                ),
                              ),
                              const SizedBox(width: 20),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  "No",
                                  style: DsFonts.bold16,
                                ),
                              ),
                            ],
                          );
                        });
                  },
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
