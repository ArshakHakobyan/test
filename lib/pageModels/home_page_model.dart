import 'package:flutter/material.dart';

class HomeScreenModel extends ChangeNotifier {
  bool isAuthorized = false;
  int curIndex = 0;

  void toggle() {
    isAuthorized = !isAuthorized;
    notifyListeners();
  }

  void setCurrentIndex({required int newIndex}) {
    curIndex = newIndex;
    notifyListeners();
  }
}
