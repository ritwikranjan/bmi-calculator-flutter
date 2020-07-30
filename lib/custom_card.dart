import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({this.cardChild, this.color, this.onPress});

  final Widget cardChild;
  final Color color;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
