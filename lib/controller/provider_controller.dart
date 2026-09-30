import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderController extends ChangeNotifier {
  bool isDark = false;

  //set data
  changeTheme (bool value) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("darkMode", value);
    isDark = value;
    notifyListeners();

  }

  //get data
  getTheme () async{
    final prefs = await SharedPreferences.getInstance();
    isDark = prefs.getBool("darkMode")??false;
    notifyListeners();
  }

  
}