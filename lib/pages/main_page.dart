import 'package:car_rental/components/my_buttom_bar.dart';
import 'package:car_rental/pages/cart_page.dart';
import 'package:car_rental/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List _pages = [
    HomePage(),
    CartPage(),
  ];

  int _currentIndex = 0;

  void tap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: MyBottomBar(onTap: tap, currentIndex: _currentIndex),
    );
  }
}
