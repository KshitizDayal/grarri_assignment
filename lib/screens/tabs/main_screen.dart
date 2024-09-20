import 'package:flutter/material.dart';
import 'package:grarri_ds/grarri_ds.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomExpansionTile(
              title: "Acai Bowls",
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return ItemContainerHorizontal(
                        imageAsset: DsImages.bowl3,
                        dishName: "Choclate Bowl",
                        price: "299",
                      );
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
