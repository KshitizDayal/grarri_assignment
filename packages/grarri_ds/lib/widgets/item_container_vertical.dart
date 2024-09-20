import 'package:flutter/material.dart';

import '../grarri_ds.dart';

class ItemContainerVertical extends StatelessWidget {
  final String imageAsset;
  final String dishName;
  final String price;
  final Widget bottomButton;
  const ItemContainerVertical({
    super.key,
    required this.imageAsset,
    required this.dishName,
    required this.price,
    required this.bottomButton,
  });

  final borderRadius8 = const Radius.circular(8);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 128,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: borderRadius8, topRight: borderRadius8),
              image: DecorationImage(
                  image: AssetImage(imageAsset), fit: BoxFit.cover),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: DsColors.white,
              borderRadius: BorderRadius.only(
                  bottomRight: borderRadius8, bottomLeft: borderRadius8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const VegIcon(),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        dishName,
                        style: DsFonts.medium14,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\u20B9 $price",
                      style: DsFonts.medium14,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    bottomButton,
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
