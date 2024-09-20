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
        color: DsColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: DsColors.black.withOpacity(0.08),
            offset: const Offset(2, 4),
            blurRadius: 3,
            spreadRadius: 1,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: decrement,
            child: SizedBox(
              width: 24,
              height: 24,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFF1F1F1),
                        shape: OvalBorder(),
                      ),
                      child: const Icon(
                        Icons.remove,
                        color: DsColors.color5BAC81,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            count.toString(),
            style: DsFonts.medium16.copyWith(color: DsColors.color4A5662),
          ),
          const SizedBox(width: 12),
          InkWell(
            onTap: increment,
            child: SizedBox(
              width: 24,
              height: 24,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFF1F1F1),
                        shape: OvalBorder(),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: DsColors.color5BAC81,
                      ),
                    ),
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
