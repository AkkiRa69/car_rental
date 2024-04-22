import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HeaderRow extends StatelessWidget {
  var primaryColor;
  var backColor;
  var secordColor;
  HeaderRow(
      {super.key,
      required this.primaryColor,
      required this.backColor,
      required this.secordColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              "Let's find your Favorite car",
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 150,
            decoration: BoxDecoration(
              color: backColor,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: secordColor, width: 3),
            ),
            padding: EdgeInsets.only(left: 25, top: 5, bottom: 5, right: 5),
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.grey),
                  suffixIcon: IconButton.filled(
                    style: IconButton.styleFrom(
                      backgroundColor: secordColor,
                    ),
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.search,
                      color: primaryColor,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
