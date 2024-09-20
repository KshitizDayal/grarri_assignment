import 'package:flutter/material.dart';
import 'package:grarri_assignment/providers/dish_provider.dart';
import 'package:grarri_assignment/screens/homescreens/homescreen.dart';
import 'package:grarri_assignment/screens/menuscreens/menuscreen.dart';
import 'package:grarri_assignment/screens/ordersscreens/orderscreen.dart';
import 'package:grarri_ds/grarri_ds.dart';
import 'package:provider/provider.dart';

import '../providers/order_provider.dart';
import 'ordersscreens/place_order_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  late OrderProvider _orderProvider;

  int currentIndex = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    MenuScreen(),
    OrdersScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });

    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlaceOrderScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    DishProvider.instance.fetchDishData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        onTap: onTabTapped,
        currentIndex: currentIndex,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.bolt),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.import_contacts),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Badge(
              label: MultiProvider(
                providers: [
                  ChangeNotifierProvider.value(value: OrderProvider.instance),
                ],
                child: Builder(builder: (BuildContext providerContext) {
                  _orderProvider = Provider.of<OrderProvider>(providerContext);

                  return Text(
                    _orderProvider.cartQuantity.toString(),
                    style: DsFonts.regular12.copyWith(color: DsColors.white),
                  );
                }),
              ),
              offset: const Offset(8, -6),
              child: const Icon(Icons.local_mall),
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
