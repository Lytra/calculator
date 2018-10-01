import 'package:flutter/material.dart';

import 'calculator_button.dart';
import 'keypad_column.dart';

const _numericColor = Color(0xFF434343);
const _operatorColor = Color(0xFF636363);

class KeypadWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KeypadState();
  }
}

class _KeypadState extends State<KeypadWidget> {
  // I wish this could be a property, but then _processKeyPressFor would not be available
  List<KeypadColumn> _keys() {
    return [
      KeypadColumn(const ["7", "4", "1", "."].map((it) => CalculatorButton.numeric(text: it, onPressed: _processKeyPressFor)).toList(), _numericColor),
      KeypadColumn(const ["8", "5", "2", "0"].map((it) => CalculatorButton.numeric(text: it, onPressed: _processKeyPressFor)).toList(), _numericColor),
      KeypadColumn(const ["9", "6", "3", null].map((it) => CalculatorButton.numeric(text: it, onPressed: _processKeyPressFor)).toList(), _numericColor),
      KeypadColumn(const ["del", "÷", "×", "-", "+"].map((it) => CalculatorButton.basic(text: it, onPressed: _processKeyPressFor)).toList(), _operatorColor)
    ];
  }
  
  void _processKeyPressFor(String buttonTitle) {
    print("Button with title $buttonTitle pressed!");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: Row(
        children: _keys().map((column) {
          return Expanded(child: column);
        }).toList()
      )
    );
  }
}