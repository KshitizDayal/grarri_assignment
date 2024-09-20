import 'package:flutter/material.dart';

import '../grarri_ds.dart';

class CartItems extends StatelessWidget {
  final bool isOrderPlaced;
  final String dishName;
  final int price;
  final int quantity;
  final Widget bottomWidget;
  const CartItems(
      {super.key,
      required this.isOrderPlaced,
      required this.dishName,
      required this.price,
      required this.quantity,
      required this.bottomWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const VegIcon(),
              const SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dishName,
                    style: DsFonts.regular14,
                  ),
                  Text(
                    "\u20B9 $price",
                    style: DsFonts.medium16,
                  ),
                ],
              ),
            ],
          ),
          isOrderPlaced
              ? Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    quantity.toString(),
                    style:
                        DsFonts.medium16.copyWith(color: DsColors.color4A5662),
                  ),
                )
              : bottomWidget
        ],
      ),
    );
  }
}
