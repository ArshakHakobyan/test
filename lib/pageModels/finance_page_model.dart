import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FinancePageModel extends ChangeNotifier {
  final pageController = PageController();
  final scrollController = ScrollController();
  int _pressedButtonNumber = 0;
  String _pressedButton = '';
  int outFlowInflowButtonNumber = 0;

  Timer? _timer;
  double _progress = 0;

  FinancePageModel() {
    _pressedButton = getCurrentMonthName();
    _pressedButtonNumber = getMonthNumber(_pressedButton) - 1;

    Timer(const Duration(milliseconds: 5), () {
      pageController.animateToPage(_pressedButtonNumber,
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    });

    Timer(const Duration(milliseconds: 5), () {
      scrollController.animateTo(_pressedButtonNumber * 160,
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    });

    startProgress();
  }

  String getCurrentMonthName() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('MMMM');
    String monthName = formatter.format(now);
    return monthName;
  }

  int getMonthNumber(String monthName) {
    var month = DateFormat.MMMM().parse(monthName).month;
    return month;
  }

  void handleButtonClick(String buttonName, int buttonNumber) {
    pageController.animateToPage(buttonNumber,
        duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    notifyListeners();
  }

  void startProgress() {
    _timer = Timer.periodic(const Duration(milliseconds: 5), (timer) {
      if (_progress > 1) {
        _timer!.cancel();
      }
      _progress += 0.0048;

      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  setOutFlowInflowButtonNumber(int number) {
    outFlowInflowButtonNumber = number;
    notifyListeners();
  }

  setPressedButtonnumber(number) {
    outFlowInflowButtonNumber = 0;
    _pressedButtonNumber = number;
    _pressedButton = '';
    notifyListeners();
  }

  get pressedButton => _pressedButton;
  get pressedButtonNumber => _pressedButtonNumber;
  double get progress => _progress;
}
