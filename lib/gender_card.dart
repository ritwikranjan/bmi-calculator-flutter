import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  final IconData icon;
  final String gender;

  const GenderCard({Key key, this.icon, this.gender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 50.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
