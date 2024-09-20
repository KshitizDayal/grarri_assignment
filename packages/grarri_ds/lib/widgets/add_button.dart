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
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: DsColors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: -5.0,
                    blurRadius: 20.0,
                  ),
                ],
              ),
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
