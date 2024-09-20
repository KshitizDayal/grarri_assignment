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
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(0.71, -0.71),
                      end: Alignment(-0.71, 0.71),
                      colors: [Color(0xFF459DAF), Color(0xFF007991)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: DsColors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
