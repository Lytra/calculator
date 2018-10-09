import 'package:flutter/material.dart';

import 'dart:async';

import 'package:calculator/settings/settings_adapter.dart';

abstract class SettingWidget<T> extends StatefulWidget {
  final String adapterKey;
  final ISettingsAdapters adapter;
  final T defaultValue;

  /// Constructs a [SettingWidget] with:
  /// [adapterKey]: The [String] in which the setting is stored in the [adapter]'s key/value store.
  /// [adapter]: The data structure that represents setting storage; can be linked to device's persisted state.
  /// [defaultValue]: The value that is displayed when [adapter] cannot provide a value, or hasn't provided a
  /// value yet for long running operations.
  const SettingWidget({this.adapterKey, this.adapter, this.defaultValue});
}

abstract class SettingWidgetState<T> extends State<SettingWidget<T>> {
  final String _key;
  final ISettingsAdapters _adapter;
  final T _defaultValue;

  T value;

  SettingWidgetState(this._key, this._adapter, this._defaultValue);

  @override
  void initState() {
    super.initState();

    _getValueForKey(_key).then((onValue) {
      setState(() {
        value = onValue;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (value == null) {
      return CircularProgressIndicator();
    } else {
      return Center(
        child: buildSetting(context, value)
      );
    }
  }

  /// Signals a change in setting state with [newValue].
  /// Will tell the [adapter] to record this change.
  void onChanged(T newValue) {
    switch (T) {
      case int: _adapter.setInt(_key, newValue as int); break;
      case double: return _adapter.setDouble(_key, newValue as double); break;
      case bool: return _adapter.setBool(_key, newValue as bool); break;
      case String: return _adapter.setString(_key, newValue as String); break;
    }

    setState(() {
      value = newValue;
    });
  }

  /// This method must be implemented in all subclasses of [SettingWidgetState].
  /// In the implementation, return a widget representing the control of the setting.
  /// It must be relatively small, and easy to use within a 100x100 logical pixel area.
  Widget buildSetting(BuildContext context, T value);

  Future<T> _getValueForKey(String key) async {
    switch (T) {
      case int: return (await _adapter.getInt(key) as T) ?? _defaultValue;
      case double: return (await _adapter.getDouble(key) as T) ?? _defaultValue;
      case bool: return (await _adapter.getBool(key) as T) ?? _defaultValue;
      case String: return (await _adapter.getString(key) as T) ?? _defaultValue;
      default: return null;
    }
  }
}

/// A [StatelessWidget] that represents a setting in a list of settings, or on its own
class SettingScaffold extends StatelessWidget {
  final String title;
  final String description;
  final Widget icon;
  final SettingWidget setting;

  /// Constructs a scaffold for a setting [Widget] with the following:
  /// [title]: The bold text to display; normally holds main idea of setting
  /// [description]: Detailed text to describe what the setting changes, optional
  /// [icon]: [Widget] that holds a graphic representation of the setting
  /// [setting]: [SettingWidget] that comprises the setting control
  const SettingScaffold({key,
    this.title,
    this.description,
    this.icon,
    this.setting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 16.0, right: 16.0, top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 48.0,
            height: 48.0,
            child: icon ?? Container()
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )
                  )
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[500]
                  )
                )
              ]
            )
          ),
          Container(
            padding: const EdgeInsets.only(left: 16.0),
            child: setting
          )
        ]
      )
    );
  }
}