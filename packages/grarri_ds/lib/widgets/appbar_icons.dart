import 'dart:ui';

import 'package:flutter/material.dart';

import '../grarri_ds.dart';

class AppBarIcons extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;
  const AppBarIcons({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: DsColors.white, // Frosted glass effect
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: DsColors.colorF1F1F1,
              width: 1.5,
            ),
          ),
          child: InkWell(
            onTap: onTap,
            child: icon,
          ),
        ),
      ),
    );
  }
}
