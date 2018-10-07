import 'package:calculator/cas/expression.dart';
import 'package:flutter/material.dart';

class DisplayWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DisplayState();
}

class _DisplayState extends State<DisplayWidget> {
  Expression _currentCalculation = Expression.debug("Expression");
  List<Expression> _calculationHistory = List();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(spreadRadius: -4.0, blurRadius: 10.0)],
        ),
        child: GestureDetector(
            onHorizontalDragDown: (e) {
              print(e.globalPosition);
            },
            child: Container(
                padding: EdgeInsets.all(40.0),
                color: Theme.of(context).canvasColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(_currentCalculation.toString(),
                            textScaleFactor: 2.5)),
                    Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          _currentCalculation.reduceToSimplestForm().toString(),
                          textScaleFactor: 1.5,
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ))
                  ],
                ))));
  }
}
