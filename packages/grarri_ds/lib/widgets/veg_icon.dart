import 'package:flutter/material.dart';

import '../grarri_ds.dart';

class VegIcon extends StatelessWidget {
  const VegIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      width: 18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 3,
          color: DsColors.color5BAC81,
        ),
      ),
      padding: const EdgeInsets.all(2),
      child: Container(
        decoration: const BoxDecoration(
          color: DsColors.color5BAC81,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
