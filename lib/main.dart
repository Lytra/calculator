import 'package:flutter/material.dart';

import 'display.dart';
import 'keypad/keypad.dart';
import 'settings/settings_screen.dart';

void main() => runApp(new CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Calculator",
      theme: new ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
      ),
      home: new CalculatorWidget(title: "Yeet the Numbers"),
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
      appBar: AppBar(
        title: Text(widget.title), 
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings), 
            onPressed: _onSettingsPressed,
            tooltip: "Settings",
          )
        ],
      ),
      body: _bodyForSize(MediaQuery.of(context).size)
    );
  }

  /// Returns the main calculator body for the given `size`
  /// If `size`'s width is greater than the height, the widgets will be layed out horizontally.
  /// Otherwise, the widgets will be layed out vertically
  Flex _bodyForSize(Size size) {
    final widgets = <Widget>[
      Expanded(
        child: Container(child: KeypadWidget()),
        flex: 1
      ),
      Expanded(
        child: DisplayWidget(),
        flex: 1
      )
    ];

    if (size.height > size.width) {
      return Column(
        verticalDirection: VerticalDirection.up,
        children: widgets
      );
    } else {
      return Row(
        children: widgets.reversed.toList()
      );
    }
  }

  void _onSettingsPressed() {
    print("Opening settings...");

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsScreen())
    );
  }
}
