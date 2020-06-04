import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'gender_card.dart';
import 'resusable_card.dart';

const bottomContainerHeight = 80.0;
const cardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);
enum genderType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;
  void updateColor(genderType gender) {
    if (gender == genderType.male) {
      if (maleCardColor == inactiveCardColor) {
        maleCardColor = cardColor;
        femaleCardColor = inactiveCardColor;
      } else {
        maleCardColor = inactiveCardColor;
      }
    }
    if (gender == genderType.female) {
      if (femaleCardColor == inactiveCardColor) {
        femaleCardColor = cardColor;
        maleCardColor = inactiveCardColor;
      } else {
        femaleCardColor = inactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(genderType.male);
                      });
                    },
                    child: ResuableCard(
                      colour: maleCardColor,
                      cardChild: GenderCard(
                        genderText: 'MALE',
                        genderIcon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(genderType.female);
                      });
                    },
                    child: ResuableCard(
                        colour: femaleCardColor,
                        cardChild: GenderCard(
                          genderIcon: FontAwesomeIcons.venus,
                          genderText: 'FEMALE',
                        )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ResuableCard(colour: cardColor),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ResuableCard(colour: cardColor),
                ),
                Expanded(
                  child: ResuableCard(colour: cardColor),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}
