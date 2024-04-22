// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:car_rental/components/car_list.dart';
import 'package:car_rental/components/detail.dart';
import 'package:car_rental/models/car_list.dart';
import 'package:car_rental/models/car_model.dart';
import 'package:car_rental/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CartPage extends StatelessWidget {
  CartPage({super.key});
  int num = 1;
  @override
  Widget build(BuildContext context) {
    return Consumer<CarProvider>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: Column(
            children: [
              //appbar
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.to(HomePage());
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFF3836b2),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Booking",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3836b2),
                    ),
                  ),
                ],
              ),

              //car tile
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                  child: ListView.builder(
                    itemCount: value.cart.length + 1,
                    itemBuilder: (context, index) {
                      if (value.cart.length == 0) {
                        return SizedBox();
                      }
                      if (index == value.cart.length) {
                        // If the index is equal to the length of the cart list,
                        // return the Detail widget.
                        return Detail();
                      } else {
                        // Otherwise, return the CarTile widget for the corresponding car.
                        CarModel car = value.cart[index];
                        return CarTile(
                          car: car,
                          onPressed: () => value.removeCarFromCart(car),
                        );
                      }
                    },
                  ),
                ),
              ),

              // Payment
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  border: Border.all(color: Colors.grey.shade200, width: 2),
                ),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sub total:",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "\$" +
                              value.totalPrice(value.cart).toStringAsFixed(2),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Driving fee:",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "\$${25.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey[200],
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total:",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "\$${(value.totalPrice(value.cart) + 25).toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFF3836b2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextButton(
                        onPressed: () {
                          value.removeAllCarFromCart(value.cart);
                        },
                        child: Text(
                          "PROCEED TO BUY",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget appbar(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Get.to(HomePage());
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF3836b2),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          "Booking",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3836b2),
          ),
        ),
      ],
    );
  }
}
