import 'package:flutter/material.dart';

class ItemGrid extends StatelessWidget {
  final double itemSize;
  final String title;
  final String description;

  ItemGrid({
    Key key,
    this.itemSize,
    this.title,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.height * 0.03)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //box with borderCorners with a letter inside
          Container(
            height: size.height * 0.1,
            width: size.height * 0.1,
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(size.height * 0.02)),
            child: Center(
              child: Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          //Spacer without graphics
          SizedBox(height: size.height * 0.02),
          //Description text
          Text(description)
        ],
      ),
    );
  }
}
