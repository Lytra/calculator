import 'package:flutter/material.dart';

import 'calculator_button.dart';


class KeypadColumn extends StatelessWidget {
  final List<CalculatorButton> _buttons;
  final Color _color;

  /// Constructs a column of [CalculatorButton]s and sets the background color
  /// [Column] will expand to fit its container
  const KeypadColumn(this._buttons, this._color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _color,
      child: Column(
        children: _buttons.map((button) {
          return Expanded(
            child: Container(
              child: button
            )
          );
        }).toList()
      )
    );
  }
}