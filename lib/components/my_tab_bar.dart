import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTabBar extends StatelessWidget {
  final List category;

  var backColor;
  var textColor;
  MyTabBar({
    super.key,
    required this.category,
    required this.backColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      splashBorderRadius: BorderRadius.circular(25),
      labelColor: Colors.black,
      unselectedLabelStyle: TextStyle(fontSize: 16),
      labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),

      tabAlignment: TabAlignment.start,
      indicator: BoxDecoration(
          color: Colors.amber[400], borderRadius: BorderRadius.circular(25)),
      dividerColor: backColor,
      unselectedLabelColor: textColor,
      isScrollable: true, // Allows tabs to scroll horizontally
      tabs: [
        for (String cat in category) Tab(text: cat),
      ],
    );
  }
}
