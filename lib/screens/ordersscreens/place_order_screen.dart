import 'package:flutter/material.dart';
import 'package:grarri_ds/grarri_ds.dart';

class PlaceOrderScreen extends StatelessWidget {
  const PlaceOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: DsColors.colorF1F1F1,
              child: CustomExpansionTile(
                title: "Current Order",
                isExpanded: true,
                children: const [
                  IncrementButton(
                    isOrderPlaced: false,
                  ),
                ],
              ),
            ),
            Container(
              color: DsColors.colorF1F1F1,
              child: CustomExpansionTile(
                title: "Previous Order",
                isExpanded: true,
                children: const [
                  IncrementButton(
                    isOrderPlaced: true,
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
