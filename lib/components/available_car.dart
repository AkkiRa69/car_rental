// ignore_for_file: prefer_const_constructors

import 'package:car_rental/models/car_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AvailableCarCard extends StatelessWidget {
  CarModel car;
  void Function()? onTap;
  AvailableCarCard({super.key, required this.car, required this.onTap});
  var textColor = Color(0xFFb6b4d7);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Color(0xFFf5f6f8),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //rate
            Row(
              children: [
                Text(
                  car.rate.toString(),
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
                Icon(
                  Icons.star_rounded,
                  color: Colors.amber[300],
                  size: 16,
                )
              ],
            ),

            //image
            Container(
              height: 70,
              child: Image.asset(
                car.image,
                fit: BoxFit.cover,
              ),
            ),

            //detail
            Spacer(),
            Text(
              car.name,
              style: TextStyle(
                  color: Color(0xFF3836b2), fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      car.price.toStringAsFixed(0) + "\$",
                      style: TextStyle(
                          color: Color(0xFF3836b2),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "/a day",
                      style: TextStyle(
                          color: textColor, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Icon(
                  CupertinoIcons.forward,
                  color: Color(0xFF3836b2),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
