import 'dart:async';

abstract class ISettingsAdapters {
  Future<int> getInt(String key);
  void setInt(String key, int value);

  Future<double> getDouble(String key);
  void setDouble(String key, double value);

  Future<bool> getBool(String key);
  void setBool(String key, bool value);

  Future<String> getString(String key);
  void setString(String key, String value);
}