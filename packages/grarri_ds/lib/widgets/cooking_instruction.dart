import 'package:flutter/material.dart';

import '../grarri_ds.dart';

class CookingInstruction extends StatelessWidget {
  const CookingInstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(
          "Add cooking instruction",
          style: DsFonts.medium14.copyWith(
            color: const Color(0xFF76DFE5),
            decoration: TextDecoration.underline,
            decorationColor: const Color(0xFF76DFE5),
            decorationThickness: 3.0,
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
