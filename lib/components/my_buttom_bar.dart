import 'package:flutter/material.dart';

class MyBottomBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int)? onTap;
  const MyBottomBar(
      {super.key, required this.onTap, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) => onTap!(value),
      currentIndex: currentIndex,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Color(0xFF3836b2),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_filled,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart,
          ),
          label: "Cart",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
          ),
          label: "Favorites",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: "Profile",
        ),
      ],
    );
  }
}
