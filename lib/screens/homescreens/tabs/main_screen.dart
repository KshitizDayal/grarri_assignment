import 'package:flutter/material.dart';
import 'package:grarri_assignment/providers/dish_provider.dart';
import 'package:grarri_ds/grarri_ds.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  late DishProvider _dishProvider;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: DishProvider.instance),
      ],
      child: Builder(builder: (BuildContext providerContext) {
        _dishProvider = Provider.of<DishProvider>(providerContext);
        return Container(
          margin: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomExpansionTile(
                  title: "Acai Bowls",
                  isExpanded: true,
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _dishProvider.dishData.length,
                        itemBuilder: (context, index) {
                          return ItemContainerHorizontal(
                            imageAsset:
                                _dishProvider.dishData[index].dishPicture!,
                            dishName: _dishProvider.dishData[index].dishName!,
                            price:
                                _dishProvider.dishData[index].price.toString(),
                          );
                        })
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
