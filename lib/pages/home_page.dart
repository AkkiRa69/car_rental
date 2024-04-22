// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:car_rental/components/available_car.dart';
import 'package:car_rental/components/car_card.dart';
import 'package:car_rental/components/header_row.dart';
import 'package:car_rental/components/my_buttom_bar.dart';
import 'package:car_rental/components/my_tab_bar.dart';
import 'package:car_rental/models/car_list.dart';
import 'package:car_rental/models/car_model.dart';
import 'package:car_rental/pages/car_detail_page.dart';
import 'package:car_rental/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

var primaryColor = Color(0xFF3836b2);

var backColor = Color(0xFFffffff);

var secordColor = Color(0xFFf5f6f8);

var textColor = Color(0xFFb6b4d7);

List category = [
  "Luxury car",
  "Family car",
  "Mini cooper",
  "Trip car",
  "Bus",
];

List cars = [
  "assets/images/2023-dodge-charger-sxt-sedan-angular-front.png",
  "assets/images/Audi-RS-Q3-ABT-8-2.png",
  "assets/images/MG6.png",
  "assets/images/revuelto_m.png",
  "assets/images/sunlit-yellow-left.png",
];

List carsDetail = [
  ["Dodge Charger", "150\$"],
  ["Audi-RS-Q3", "250\$"],
  ["MG6", "120\$"],
  ["Revuelto-m", "110\$"],
  ["Sunlit-Yellow", "130\$"],
];

class _HomePageState extends State<HomePage> {
  int index = 0;

  void onTap(int value) {
    setState(() {
      index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CarProvider>(
      builder: (context, value, child) => DefaultTabController(
        length: category.length,
        child: Scaffold(
          backgroundColor: backColor,
          body: ListView(
            children: [
              //appbar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Builder(builder: (context) {
                      return IconButton(
                        icon: Icon(
                          Icons.vertical_distribute_rounded,
                          size: 24,
                          color: primaryColor,
                        ),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: IconButton.filled(
                      onPressed: () {
                        Get.to(CartPage());
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
              //header
              HeaderRow(
                primaryColor: primaryColor,
                backColor: backColor,
                secordColor: secordColor,
              ),

              //tab bar
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 15, bottom: 23),
                child: MyTabBar(
                    category: category,
                    backColor: backColor,
                    textColor: textColor),
              ),

              // car card
              CarCard(
                cars: cars,
                spec: carsDetail,
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Text(
                  "Availabel Near You",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                width: double.infinity,
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  itemCount: value.Cars.length,
                  itemBuilder: (context, index) {
                    CarModel car = value.cars[index];
                    return AvailableCarCard(
                      car: car,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CarDetailPage(cars: car),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          bottomNavigationBar: MyBottomBar(
            onTap: (value) {
              onTap(value);
              if (index == 1) {
                Get.to(CartPage());
              }
            },
            currentIndex: index,
          ),
          drawer: Drawer(
            backgroundColor: Colors.grey[200],
            child: Column(
              children: [
                DrawerHeader(
                  child: Image.asset(
                      "assets/images/2023-dodge-charger-sxt-sedan-angular-front.png"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.home_filled,
                      size: 32,
                    ),
                    title: Text(
                      "Home Page",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Get.to(HomePage());
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF3836b2),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.shopping_cart,
                      size: 32,
                    ),
                    title: Text(
                      "Cart Page",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Get.to(CartPage());
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF3836b2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
