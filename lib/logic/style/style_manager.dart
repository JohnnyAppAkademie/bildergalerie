import 'package:bildergalerie/logic/classes/style.dart';
import 'package:flutter/material.dart';

class StyleManager with ChangeNotifier {
  bool _isLight = false;

  bool get isLight => _isLight;
  AppStyle get style => _isLight ? AppStyle.light() : AppStyle.dark();

  void toggleTheme() {
    _isLight = !_isLight;
    notifyListeners();
  }
}
