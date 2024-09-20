import 'package:flutter/material.dart';

import '../grarri_ds.dart';

class OrderPlacingButton extends StatelessWidget {
  final String itemQuantity;
  final VoidCallback placeOrder;
  const OrderPlacingButton(
      {super.key, required this.itemQuantity, required this.placeOrder});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF459EAF),
              Color(0xFF007991),
            ],
          ),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 18),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: InkWell(
        onTap: placeOrder,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$itemQuantity Items",
              style: DsFonts.bold14.copyWith(color: DsColors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "PLACE ORDER",
                  style: DsFonts.regular14.copyWith(color: DsColors.white),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.arrow_forward,
                  color: DsColors.white,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
