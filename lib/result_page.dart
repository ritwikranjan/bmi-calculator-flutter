import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_card.dart';

class ResultPage extends StatelessWidget {
  final String BMIResult, BMIIndex, BMIInterpratation;

  const ResultPage(
      {Key key,
      @required this.BMIResult,
      @required this.BMIIndex,
      @required this.BMIInterpratation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CustomCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    BMIResult,
                    style: kResultCategoryStyle,
                  ),
                  Text(
                    BMIIndex,
                    style: kResultTextStyle,
                  ),
                  Text(
                    BMIInterpratation,
                    style: TextStyle(fontSize: 22.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: BottomContainer(
                    text: 'RE-CALCULATE',
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
