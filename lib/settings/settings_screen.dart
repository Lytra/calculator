import 'package:flutter/material.dart';

import 'package:calculator/settings/setting.dart';
import 'package:calculator/settings/settings_types.dart';
import 'package:calculator/settings/shared_preferences_settings_adapter.dart';

class SettingsScreen extends StatelessWidget {
  static final _adapter = SharedPreferencesSettingsAdapter();

  final List<SettingScaffold> _settings = [
    SettingScaffold(
      title: "Input Hand", 
      description: "In landscape orientation, display the keypad on the left or right side of the screen.", 
      icon: Icon(Icons.compare_arrows), 
      setting: ListSetting(
        adapterKey: "input_hand", 
        adapter: _adapter,
        items: ["Left", "Right"],
        defaultValue: 0
      )
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings")
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return _settings[index];
        },
        itemCount: _settings.length,
      )
    );
  }
}