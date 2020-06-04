import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  GenderCard({@required this.genderIcon, @required this.genderText});
  final String genderText;
  final IconData genderIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          genderText,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}
