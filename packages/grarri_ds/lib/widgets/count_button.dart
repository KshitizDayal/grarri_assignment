import 'package:flutter/material.dart';

import '../grarri_ds.dart';

class CountButton extends StatelessWidget {
  final VoidCallback increment;
  final VoidCallback decrement;
  final int count;
  const CountButton(
      {super.key,
      required this.increment,
      required this.decrement,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 4,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: decrement,
            child: Container(
              decoration: const BoxDecoration(
                  color: DsColors.white, shape: BoxShape.circle),
              child: const Icon(
                Icons.remove,
                color: DsColors.color5BAC81,
              ),
            ),
          ),
          const SizedBox(width: 4),
          Text(
            count.toString(),
            style: DsFonts.medium16.copyWith(color: DsColors.color4A5662),
          ),
          const SizedBox(width: 4),
          InkWell(
            onTap: increment,
            child: Container(
              decoration: const BoxDecoration(
                  color: DsColors.white, shape: BoxShape.circle),
              child: const Icon(
                Icons.add,
                color: DsColors.color5BAC81,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
