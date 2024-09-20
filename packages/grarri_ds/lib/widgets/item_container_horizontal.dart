import 'package:flutter/material.dart';

import '../grarri_ds.dart';

class ItemContainerHorizontal extends StatelessWidget {
  final String imageAsset;
  final String dishName;
  final String price;
  const ItemContainerHorizontal(
      {super.key,
      required this.imageAsset,
      required this.dishName,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: DsColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: 70,
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
              margin: const EdgeInsets.symmetric(vertical: 4),
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
                      Text(
                        "\u20B9 $price",
                        style: DsFonts.medium14,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 4),
                        child: const AddButton(),
                      ),
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
