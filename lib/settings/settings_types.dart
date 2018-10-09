import 'package:flutter/material.dart';

import 'package:calculator/settings/setting.dart';
import 'package:calculator/settings/settings_adapter.dart';

class BoolSetting extends SettingWidget<bool> {
  BoolSetting({String adapterKey, ISettingsAdapters adapter, bool defaultValue}) :
            super(adapterKey: adapterKey, adapter: adapter, defaultValue: defaultValue);

  @override
  State createState() {
    return _BoolSettingState(adapterKey, adapter, defaultValue);
  }
}

class _BoolSettingState extends SettingWidgetState<bool> {
  _BoolSettingState(String key, ISettingsAdapters adapter, bool defaultValue) : super(key, adapter, defaultValue);

  @override
  Widget buildSetting(BuildContext context, bool value) {
    return Switch(
      value: value,
      onChanged: onChanged
    );
  }
}

class ListSetting extends SettingWidget<int> {
  final List<String> items;

  ListSetting({String adapterKey, ISettingsAdapters adapter, this.items, int defaultValue}) :
          super(adapterKey: adapterKey, adapter: adapter, defaultValue: defaultValue);

  @override
  State<StatefulWidget> createState() {
    return _ListSettingState(adapterKey, adapter, items, defaultValue);
  }
}

class _ListSettingState extends SettingWidgetState<int> {
  final List<String> _items;
  
  _ListSettingState(String key, ISettingsAdapters adapter, this._items, int defaultValue) : super(key, adapter, defaultValue);

  @override
  Widget buildSetting(BuildContext context, int value) {
    int index = 0;
    print(value);
    return Container(
      padding: EdgeInsets.only(right: 16.0),
      child: DropdownButton(
        value: value,
        isDense: false,
        items: _items.map((it) => DropdownMenuItem(
          value: index++,
          child: Text(it)
        )).toList(),
        onChanged: (newValue) {
          onChanged(newValue);
        },
      )
    );
  }
}