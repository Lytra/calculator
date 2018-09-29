import 'package:flutter/material.dart';
import 'package:calculator/display.dart';
import 'package:calculator/keypad.dart';

void main() => runApp(new CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Calculator',
      theme: new ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: new CalculatorWidget(title: 'This is a page'),
    );
  }
}

class CalculatorWidget extends StatefulWidget {
  CalculatorWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CalculatorState createState() => new _CalculatorState();
}

class _CalculatorState extends State<CalculatorWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Column(children: <Widget>[
          Container(child: DisplayWidget()),
          Container(child: KeypadWidget())
        ]));
  }
}
