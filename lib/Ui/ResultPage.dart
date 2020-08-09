import 'package:flutter/material.dart';
import '../ScreenArguments.dart';
import 'ReusableCard.dart';

class ResultPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var activeCardColor = Color(0xff272B4D);
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Container(
            padding: EdgeInsets.only(left: 16.0, top: 16.0),
            child: Text('Your Result',style: TextStyle(
                color: Color(0xffA9AABA),
              fontSize: 35.0,
              fontWeight: FontWeight.w700
            ),),
          ),),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(args.BmiResult.toUpperCase(), style: TextStyle(color: Colors.green, fontSize: 23.0),),
                  Text(args.Bmi, style: TextStyle(
                    fontSize: 100.0,
                    fontWeight: FontWeight.w700
                  ),),
                  Text(args.BmiFeedback, style: TextStyle(
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              child: Center(
                child: Text(
                  'RE-CALCULATE',
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
    );
  }
}
