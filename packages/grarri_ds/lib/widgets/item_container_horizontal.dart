import 'package:flutter/material.dart';

import '../grarri_ds.dart';

class ItemContainerHorizontal extends StatelessWidget {
  final String imageAsset;
  final String dishName;
  final String price;
  final Widget bottomButton;
  const ItemContainerHorizontal(
      {super.key,
      required this.imageAsset,
      required this.dishName,
      required this.price,
      required this.bottomButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: DsColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 80,
            width: 80,
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imageAsset),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dishName,
                    style: DsFonts.medium14,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const VegIcon(),
                          const SizedBox(width: 6),
                          Text(
                            "\u20B9$price",
                            style: DsFonts.medium14,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: bottomButton,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
