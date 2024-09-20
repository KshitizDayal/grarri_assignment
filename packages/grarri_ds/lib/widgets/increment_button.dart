import 'package:flutter/material.dart';

import '../grarri_ds.dart';

class IncrementButton extends StatelessWidget {
  final bool isOrderPlaced;
  const IncrementButton({super.key, required this.isOrderPlaced});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            VegIcon(),
            SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sunrise Acai Bowl",
                  style: DsFonts.regular14,
                ),
                Text(
                  "\u20B9 299",
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
                  "1",
                  style: DsFonts.medium16.copyWith(color: DsColors.color4A5662),
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 4,
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: DsColors.white, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.remove,
                        color: DsColors.color5BAC81,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "1",
                      style: DsFonts.medium16
                          .copyWith(color: DsColors.color4A5662),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      decoration: const BoxDecoration(
                          color: DsColors.white, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.add,
                        color: DsColors.color5BAC81,
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
