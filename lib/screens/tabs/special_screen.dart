import 'package:flutter/material.dart';
import 'package:grarri_ds/grarri_ds.dart';

class SpecialScreen extends StatelessWidget {
  const SpecialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 130,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: DsColors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: const EdgeInsets.all(4),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: RadialGradient(
                    center: Alignment.bottomLeft,
                    radius: 4,
                    colors: [
                      const Color(0xFF000000).withOpacity(0.6),
                      const Color(0xFF000000).withOpacity(0.2),
                    ],
                    stops: const [0.25, 0.53],
                  ),
                ),
                padding: const EdgeInsets.only(left: 12, bottom: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome to",
                      style: DsFonts.medium16.copyWith(color: DsColors.white),
                    ),
                    Text(
                      "Sunrise Cafe",
                      style: DsFonts.medium16.copyWith(color: DsColors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Today's Special",
                    style:
                        DsFonts.medium14.copyWith(color: DsColors.color4A5662)),
                const SizedBox(width: 12),
                Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(top: 2),
                        child: Divider(
                            color: DsColors.color4A5662.withOpacity(0.4)))),
                const SizedBox(width: 6),
                const Icon(
                  Icons.arrow_drop_up,
                  color: DsColors.color3CBCB4,
                  size: 32,
                ),
              ],
            ),
            const SizedBox(height: 24),
            GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.85,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return const ItemContainerVertical(
                  imageAsset: DsImages.bowl1,
                  dishName: "Choclate Bowl",
                  price: "299",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
