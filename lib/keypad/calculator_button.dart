import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final double highlightDiameter;
  final Function onPressed;

  CalculatorButton({this.text, this.fontSize, this.highlightDiameter, this.onPressed});

  CalculatorButton.numeric({this.text, this.onPressed, this.fontSize = 30.0, this.highlightDiameter = 80.0});
  CalculatorButton.basic({this.text, this.onPressed, this.fontSize = 23.0, this.highlightDiameter = 80.0});

  @override
  Widget build(BuildContext context) {
    if (text == null) return Container();
    else return Container(
      color: Colors.transparent,
      child: OverflowBox(
        alignment: Alignment.center,
        minWidth: highlightDiameter,
        minHeight: highlightDiameter,
        maxWidth: double.infinity,
        maxHeight: double.infinity,
        child: Container(
          width: highlightDiameter,
          height: highlightDiameter,
          child: RawMaterialButton(
            onPressed: () {
              onPressed(text);
            },
            child: Text(text,
              style: TextStyle(
                color: _textColorForContext(context),
                fontSize: fontSize,
                fontWeight: FontWeight.w300
              ),
            ),
            elevation: 0.0,
            shape: new CircleBorder(),
            fillColor: Colors.transparent,
            highlightColor: Colors.transparent,
            highlightElevation: 0.0,
          )
        )
      )
    );
  }

  Color _textColorForContext(BuildContext context) {
    return Theme.of(context).primaryTextTheme.body1.color;
  }
}