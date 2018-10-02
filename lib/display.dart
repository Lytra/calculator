import 'package:calculator/cas/expression.dart';
import 'package:flutter/material.dart';

class DisplayWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DisplayState();
}

class _DisplayState extends State<DisplayWidget> {
  Expression _currentCalculation = Expression.debug("");
  List<Expression> _calculationHistory = List();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(spreadRadius: -4.0, blurRadius: 10.0)],
      ),
      child: Container(
        color: Theme.of(context).canvasColor,
        child: Center(
          child: Text(_currentCalculation.toString(), textScaleFactor: 2.0)
        ),
      )
    );
  }
}