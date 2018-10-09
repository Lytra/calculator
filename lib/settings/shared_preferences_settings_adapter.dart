import 'package:shared_preferences/shared_preferences.dart';

import 'dart:async';

import 'package:calculator/settings/settings_adapter.dart';

class SharedPreferencesSettingsAdapter extends ISettingsAdapters {
  @override
  Future<bool> getBool(String key) async {
    return (await SharedPreferences.getInstance()).getBool(key);
  }

  @override
  Future<double> getDouble(String key) async {
    return (await SharedPreferences.getInstance()).getDouble(key);
  }

  @override
  Future<int> getInt(String key) async {
    return (await SharedPreferences.getInstance()).getInt(key);
  }

  @override
  Future<String> getString(String key) async {
    return (await SharedPreferences.getInstance()).getString(key);
  }

  @override
  void setBool(String key, bool value) async {
    (await SharedPreferences.getInstance()).setBool(key, value);
  }

  @override
  void setDouble(String key, double value) async {
    (await SharedPreferences.getInstance()).setDouble(key, value);
  }

  @override
  void setInt(String key, int value) async {
    (await SharedPreferences.getInstance()).setInt(key, value);
  }

  @override
  void setString(String key, String value) async {
    (await SharedPreferences.getInstance()).setString(key, value);
  }
}