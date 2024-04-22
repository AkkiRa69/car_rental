// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarCard extends StatefulWidget {
  final List cars;
  final List spec;
  CarCard({
    super.key,
    required this.cars,
    required this.spec,
  });

  @override
  State<CarCard> createState() => _CarCardState();
}

class _CarCardState extends State<CarCard> {
  //
  late PageController carController;
  late PageController specController;

  @override
  void initState() {
    super.initState();
    carController = PageController(initialPage: 0);
    specController = PageController(initialPage: 0);

    // Add a listener to carController to update specController's page when carController is scrolled
    carController.addListener(() {
      specController.animateToPage(carController.page!.round(),
          duration: Duration(milliseconds: 50), curve: Curves.easeIn);
    });
    specController.addListener(() {
      carController.animateToPage(specController.page!.round(),
          duration: Duration(milliseconds: 50), curve: Curves.easeIn);
    });
  }

  @override
  void dispose() {
    carController.dispose();
    specController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double corner = 110;

    return Column(
      children: [
        //car show
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF4444b6),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(corner),
              bottomLeft: Radius.circular(corner),
            ),
          ),
          margin: EdgeInsets.only(left: 25),
          child: PageView(
            controller: carController,
            children: [
              for (int i = 0; i < widget.cars.length; i++)
                Container(
                  child: Image.asset(
                    widget.cars[i],
                  ),
                ),
            ],
          ),
        ),

        //detail
        Container(
          height: 80,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 2,
              color: Color(0xFFedf7fe),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFf5f6f8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: PageView(
                    controller: specController,
                    children: [
                      for (int i = 0; i < widget.spec.length; i++)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.spec[i][0],
                              style: TextStyle(
                                color: Color(0xFF4444b6),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      widget.spec[i][1],
                                      style: TextStyle(
                                        color: Color(0xFF4444b6),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "/a day",
                                      style: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "4.5",
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xFF4444b6),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SmoothPageIndicator(
                          effect: JumpingDotEffect(
                            dotHeight: 7,
                            dotWidth: 7,
                            // jumpScale: 15,
                            verticalOffset: 20,
                          ),
                          controller: carController,
                          count: widget.cars.length),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF4444b6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
