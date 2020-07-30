import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bmi_calculator.dart';
import 'constants.dart';
import 'custom_card.dart';
import 'gender_card.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  double height = 150;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CustomCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      cardChild: GenderCard(
                        icon: FontAwesomeIcons.mars,
                        gender: 'MALE',
                      ),
                      color: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                    ),
                  ), //Male Card
                  Expanded(
                    child: CustomCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      cardChild: GenderCard(
                        icon: FontAwesomeIcons.venus,
                        gender: 'FEMALE',
                      ),
                      color: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                    ),
                  ), //Female Card
                ],
              ),
            ), //Male Female Selector Row
            Expanded(
              child: CustomCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.round().toString(),
                          style: kNumberStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30.0,
                        ),
                      ),
                      child: Slider(
                        value: height,
                        min: 120,
                        max: 220,
                        onChanged: (it) {
                          setState(() {
                            height = it;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ), //Height Slider Card
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CustomCard(
                      color: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: <Widget>[
                              Text(
                                weight.toString(),
                                style: kNumberStyle,
                              ),
                              Text(
                                'kg',
                                style: kLabelTextStyle,
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                      if (weight < 5) {
                                        weight = 5;
                                      }
                                    });
                                  },
                                  icon: FontAwesomeIcons.minus,
                                ),
                              ),
                              Expanded(
                                child: RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                      if (weight > 200) {
                                        weight = 200;
                                      }
                                    });
                                  },
                                  icon: FontAwesomeIcons.plus,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ), //Weight
                  Expanded(
                    child: CustomCard(
                      color: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: <Widget>[
                              Text(
                                age.toString(),
                                style: kNumberStyle,
                              ),
                              Text(
                                'years',
                                style: kLabelTextStyle,
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                      if (age < 2) {
                                        age = 2;
                                      }
                                    });
                                  },
                                  icon: FontAwesomeIcons.minus,
                                ),
                              ),
                              Expanded(
                                child: RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                      if (age > 120) {
                                        age = 120;
                                      }
                                    });
                                  },
                                  icon: FontAwesomeIcons.plus,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ), //Age
                ],
              ),
            ), //Weight and Age Card
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      BMICalculator bmiCalc =
                          BMICalculator(height: height.round(), weight: weight);
                      return ResultPage(
                        BMIResult: bmiCalc.getBMIResult(),
                        BMIIndex: bmiCalc.getBMIIndex(),
                        BMIInterpratation: bmiCalc.getBMIInterpratation(),
                      );
                    },
                  ),
                );
              },
              child: BottomContainer(
                text: 'CALCULATE',
              ),
            ), //Bottom Navigator
          ],
        ), //Main Column
      ),
    );
  }
}

class BottomContainer extends StatelessWidget {
  final String text;

  const BottomContainer({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.only(bottom: 15.0),
      color: Color(0xFFEB1555),
      width: double.maxFinite,
      height: 80.0,
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  const RoundIconButton({Key key, this.onPressed, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: EdgeInsets.all(12.0),
      onPressed: onPressed,
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      child: Icon(icon),
    );
  }
}
