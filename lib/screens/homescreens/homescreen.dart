import 'package:flutter/material.dart';
import 'package:grarri_assignment/screens/homescreens/tabs/beverages_screen.dart';
import 'package:grarri_assignment/screens/homescreens/tabs/desserts_screen.dart';
import 'package:grarri_assignment/screens/homescreens/tabs/main_screen.dart';
import 'package:grarri_assignment/screens/homescreens/tabs/special_screen.dart';
import 'package:grarri_ds/grarri_ds.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 4,
          shadowColor: DsColors.colorF0F3F1,
          backgroundColor: DsColors.colorF0F3F1,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          leading: Container(
            margin: const EdgeInsets.only(left: 24),
            decoration: const BoxDecoration(
              color: DsColors.colorA9ACAA,
              shape: BoxShape.circle,
            ),
          ),
          titleSpacing: 4,
          title: Text(
            "Sunrise Cafe",
            style: DsFonts.bold16.copyWith(color: DsColors.color4A5662),
          ),
          actions: [
            AppBarIcons(
              icon: const Icon(Icons.record_voice_over),
              onTap: () {},
            ),
            const SizedBox(width: 12),
            AppBarIcons(
              icon: const Icon(Icons.tag),
              onTap: () {},
            ),
            const SizedBox(width: 12),
          ],
          bottom: TabBar(
            indicatorColor: DsColors.color3CBCB4,
            labelColor: DsColors.color3CBCB4,
            unselectedLabelColor: DsColors.color4A5662.withOpacity(0.4),
            dividerColor: Colors.transparent,
            labelStyle: DsFonts.bold14,
            unselectedLabelStyle: DsFonts.bold14,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: const [
              Tab(text: "Special"),
              Tab(text: "Main"),
              Tab(text: "Desserts"),
              Tab(text: "Beverages"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SpecialScreen(),
            MainScreen(),
            const DessertsScreen(),
            const BeveragesScreen(),
          ],
        ),
      ),
    );
  }
}
