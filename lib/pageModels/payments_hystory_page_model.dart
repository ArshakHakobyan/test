import 'package:flutter/material.dart';

import '../widgets/db.dart';

class PaymentsHistoryPageModel extends ChangeNotifier {
  final pageController = PageController();
  int pressedButtonNumber = 0;

  void animateTo({required int page}) {
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);

    notifyListeners();
  }

  void pageNumber({required int pageNum}) {
    pressedButtonNumber = pageNum;
    notifyListeners();
  }

  double getTotalAmount({required List<Map> mapsOfPayments}) {
    double total = 0;
    for (int i = 0; i < mapsOfPayments.length; i++) {
      total += double.parse(mapsOfPayments[i]['amount']);
    }
    return total;
  }

  final List<Map> _mapsOfPaymentsForTerminal = [];
  final List<Map> _mapsOfPaymentsForWallet = [];

  Future<void> _loadDataFromDatabase2() async {
    List<Map<String, dynamic>> dataW =
        await DatabaseHelper.instance.readDataFromDatabase(terminalDb: true);
    for (Map item in dataW) {
      _mapsOfPaymentsForTerminal.add(item);
    }
    notifyListeners();
  }

  Future<void> _loadDataFromDatabase3() async {
    List<Map<String, dynamic>> dataW =
        await DatabaseHelper.instance.readDataFromDatabase(walletDb: true);
    for (Map item in dataW) {
      _mapsOfPaymentsForWallet.add(item);
    }
    notifyListeners();
  }

  List<Map> get mapsOfPaymentsForTerminal {
    if (_mapsOfPaymentsForTerminal.isEmpty) {
      _loadDataFromDatabase2();
    }
    return _mapsOfPaymentsForTerminal;
  }

  List<Map> get mapsOfPaymentsForWallet {
    if (_mapsOfPaymentsForWallet.isEmpty) {
      _loadDataFromDatabase3();
    }
    return _mapsOfPaymentsForWallet;
  }
}
