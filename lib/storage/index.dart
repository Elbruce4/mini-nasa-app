
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

writeData (value , String key) async {

  final prefs = await SharedPreferences.getInstance();
  String type = value.runtimeType.toString().toLowerCase();
  print(type);

  switch (type) {
    case "string":
      await prefs.setString(key, value);
      break;
    case "bool":
      await prefs.setBool(key, value);
      break;
    case "int":
    case "double":
      await prefs.setDouble(key, value);
      break;
    default:
  }
  
}

readData (type , String key) async {
  
  final prefs = await SharedPreferences.getInstance();

  switch (type) {
    case "string":
      return prefs.getString(key);
    case "bool":
      return prefs.getBool(key);
    case "int":
    case "double":
      return prefs.getDouble(key);
    default:
  }


}