import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 230,
      // color: Colors.blue,
      padding: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Row 1
          Text(
            "Delivery to",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  "140 Laurie Meadows Drive, San Matero CA, US, 994403",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey[600]),
                ),
              ),
              Expanded(child: SizedBox()),
              IconButton.filled(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.grey[300]),
                onPressed: () {},
                icon: Icon(
                  Icons.location_on,
                  color: Colors.black,
                ),
              )
            ],
          ),

          //Row 2
          SizedBox(
            height: 20,
          ),
          Text(
            "Payment Method",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/visa.png",
                      height: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Visa Classic",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "***** 9338",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: SizedBox()),
              IconButton.filled(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.grey[300]),
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
