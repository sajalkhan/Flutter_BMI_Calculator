import 'ReusableCard.dart';
import 'ReusableIcon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }
Gender selectedGender;

class InputPage extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    var activeCardColor = Color(0xff272B4D);
    var inactiveCardColor = Color(0xff151A3C);

    var height = MediaQuery.of(context).size.height;
    var buttonHeight = height / 12;

    updateGender(Gender gender) {
      setState(() {
        selectedGender = gender;
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
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
                      child: ReusableCard(colour: inactiveCardColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(colour: inactiveCardColor),
                    ),
                    Expanded(
                      child: ReusableCard(colour: inactiveCardColor),
                    ),
                  ],
                ),
              ),
              Container(
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                margin: EdgeInsets.only(top: 10.0),
                color: Colors.pinkAccent,
                height: buttonHeight,
                width: double.infinity,
              )
            ],
          ),
        ));
  }
}
