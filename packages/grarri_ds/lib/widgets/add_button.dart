import 'package:flutter/material.dart';

import '../grarri_ds.dart';

class AddButton extends StatelessWidget {
  final VoidCallback onTap;
  const AddButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: DsColors.colorF0F0F3,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: DsColors.white, shape: BoxShape.circle),
              child: const Icon(
                Icons.add,
                color: DsColors.color5BAC81,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              "ADD",
              style: DsFonts.medium16.copyWith(color: DsColors.color4A5662),
            )
          ],
        ),
      ),
    );
  }
}
