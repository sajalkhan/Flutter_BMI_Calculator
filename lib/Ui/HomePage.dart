import 'package:flutter/cupertino.dart';

import 'ReusableCard.dart';
import 'ReusableIcon.dart';
import 'CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/CalculateBMI.dart';
import 'package:bmi_calculator/ScreenArguments.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }
enum buttonData { plus, minus }

Gender selectedGender;
int userHeight = 180;
int userWeight = 45;
int userAge = 14;

class InputPage extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    var activeCardColor = Color(0xff272B4D);
    var inactiveCardColor = Color(0xff151A3C);

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    updateGender(Gender gender) {
      setState(() {
        selectedGender = gender;
      });
    }

    updateWeight(buttonData data) {
      setState(() {
        data == buttonData.plus
            ? userWeight++
            : userWeight > 0 ? userWeight-- : null;
      });
    }

    updateAge(buttonData data) {
      setState(() {
        data == buttonData.plus ? userAge++ : userAge > 0 ? userAge-- : null;
      });
    }

    CalculateBMI cal;

    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        onPress: () => updateGender(Gender.male),
                        colour: selectedGender == Gender.male
                            ? activeCardColor
                            : inactiveCardColor,
                        cardChild: ReusableIcon(
                            icon: FontAwesomeIcons.mars, label: 'MALE'),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () => updateGender(Gender.female),
                        colour: selectedGender == Gender.female
                            ? activeCardColor
                            : inactiveCardColor,
                        cardChild: ReusableIcon(
                            icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        colour: inactiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'HEIGHT',
                              style: TextStyle(color: Color(0xffA9AABA)),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              mainAxisAlignment: MainAxisAlignment.center,
                              textBaseline: TextBaseline.ideographic,
                              children: <Widget>[
                                Text(
                                  userHeight.toString(),
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  'cm',
                                  style: TextStyle(color: Color(0xffA9AABA)),
                                )
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                thumbColor: Color(0xffeb1555),
                                overlayColor: Color(0x29eb1555),
                                activeTrackColor: Colors.white,
                                inactiveTrackColor: Color(0xff8d8e98),
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15.0),
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 30.0),
                              ),
                              child: Slider(
                                value: userHeight.toDouble(),
                                min: 120.0,
                                max: 220.0,
                                onChanged: (double newValue) {
                                  setState(() {
                                    userHeight = newValue.round();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        colour: inactiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'WEIGHT',
                              style: TextStyle(
                                color: Color(0xffA9AABA),
                              ),
                            ),
                            Text(
                              userWeight.toString(),
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.w700),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CustomButton(
                                  onPress: () => updateWeight(buttonData.minus),
                                  icon: FontAwesomeIcons.minus,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                CustomButton(
                                  onPress: () => updateWeight(buttonData.plus),
                                  icon: FontAwesomeIcons.plus,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                          colour: inactiveCardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'AGE',
                                style: TextStyle(
                                  color: Color(0xffA9AABA),
                                ),
                              ),
                              Text(
                                userAge.toString(),
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.w700),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  CustomButton(
                                    onPress: () => updateAge(buttonData.minus),
                                    icon: FontAwesomeIcons.minus,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  CustomButton(
                                    onPress: () => updateAge(buttonData.plus),
                                    icon: FontAwesomeIcons.plus,
                                  ),
                                ],
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => {
                  cal = CalculateBMI(height: userHeight, weight: userWeight),
                  Navigator.pushNamed(context, '/result', arguments: ScreenArguments(
                    Bmi: cal.calculatedBMI(), BmiResult: cal.getResult(), BmiFeedback: cal.getFeedback()
                  )),
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'CALCULATE',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  margin: EdgeInsets.only(top: 10.0),
                  color: Colors.pinkAccent,
                  height: screenHeight / 12,
                  width: double.infinity,
                ),
              )
            ],
          ),
        ));
  }
}
