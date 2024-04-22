// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:car_rental/components/row.dart';
import 'package:car_rental/models/car_list.dart';
import 'package:car_rental/models/car_model.dart';
import 'package:car_rental/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CarDetailPage extends StatefulWidget {
  final CarModel cars;
  CarDetailPage({super.key, required this.cars});

  @override
  State<CarDetailPage> createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage> {
  final double height = 450;

  int turns = 1;

  @override
  Widget build(BuildContext context) {
    //function
    void addToCart(CarModel car) {
      Provider.of<CarProvider>(context, listen: false).addCarToCart(car);
    }

    return Scaffold(
      backgroundColor: Color(0xFFffffff),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //appbar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Get.to(HomePage());
                  },
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert_sharp),
                ),
              ],
            ),
            //carspec
            Row(
              children: [
                //spec colum
                Expanded(
                  child: Container(
                    height: height,
                    padding: EdgeInsets.only(top: 15),
                    margin: EdgeInsets.only(right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Car Specs",
                          style: TextStyle(
                              color: Color(0xFF3836b2),
                              fontSize: 24,
                              fontWeight: FontWeight.w500),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              List spec = [
                                ["Max Power", widget.cars.hp],
                                ["02-60 mph", widget.cars.sec],
                                ["Top Speed", widget.cars.topSpeed]
                              ];
                              List text = ["hp", "sec", "mph"];
                              return Container(
                                width: double.infinity,
                                height: 80,
                                padding: EdgeInsets.all(15),
                                margin: EdgeInsets.symmetric(vertical: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                      color: Color(0xFFedf7fe), width: 2),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      spec[index][0],
                                      style: TextStyle(
                                          color: Color(0xFF3836b2),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          spec[index][1].toString(),
                                          style: TextStyle(
                                              color: Color(0xFF3836b2),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          " " + text[index],
                                          style: TextStyle(
                                              color: Color(0xFFb6b4d7),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                //banner
                Expanded(
                  child: Container(
                    height: height,
                    decoration: BoxDecoration(
                      color: Color(0xFF3836b2),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.elliptical(100, 100),
                        bottomRight: Radius.elliptical(100, 100),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 10),
                          child: Text(
                            widget.cars.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        // Spacer(),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (turns == 1) {
                                turns = 3;
                              } else
                                turns = 1;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: RotatedBox(
                              quarterTurns: turns,
                              child: Image.asset(
                                widget.cars.image,
                                alignment: Alignment.center,
                                fit: BoxFit.cover,
                                height: 160,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Text(
              "Car info",
              style: TextStyle(
                  color: Color(0xFF3836b2),
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFf5f6f8),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 120,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Row 1
                          RowHeader(
                              icon: Icons.person,
                              text:
                                  "${widget.cars.passengers.toStringAsFixed(0)} Passengers"),
                          //Row 2
                          RowHeader(
                              icon: Icons.air_outlined,
                              text: "Air Conditioning"),
                          //Row 3
                          RowHeader(
                              icon: Icons.speed_rounded,
                              text: "Unlimited Mileage"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //Row 1
                          RowHeader(
                              icon: Icons.door_back_door_outlined,
                              text:
                                  "${widget.cars.doors.toStringAsFixed(0)} Doors"),
                          //Row 2
                          RowHeader(
                              icon: Icons.category_rounded, text: "Manual"),
                          //Row 3
                          RowHeader(
                              icon: Icons.local_gas_station, text: "Fuel info"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //price + button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //price
                  Row(
                    children: [
                      Text(
                        "\$" + widget.cars.price.toStringAsFixed(0),
                        style: TextStyle(
                            color: Color(0xFF3836b2),
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "/day",
                        style: TextStyle(
                            color: Color.fromARGB(255, 150, 149, 236),
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),

                  //button
                  ElevatedButton(
                    onPressed: () {
                      addToCart(widget.cars);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[600],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 20),
                      child: Text(
                        "Book Now",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
