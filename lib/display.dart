import 'package:flutter/material.dart';

class DisplayWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DisplayState();
  }
}

class _DisplayState extends State<DisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(spreadRadius: -4.0, blurRadius: 10.0)],
      ),
      child: Container(
        color: Theme.of(context).canvasColor
      )
    );
  }
}