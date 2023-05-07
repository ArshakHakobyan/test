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

  Future<List<Map<String, dynamic>>> _loadDataFromDatabase(
      {bool? walletDb, bool? terminalDb}) async {
    DatabaseHelper dbHelper = DatabaseHelper.instance;

    if (walletDb != null) {
      return await dbHelper.readDataFromDatabase(walletDb: true);
    } else if (terminalDb != null) {
      return await dbHelper.readDataFromDatabase(terminalDb: true);
    } else {
      throw ArgumentError("Either walletDb or terminalDb must be set");
    }
  }

  List<Map> get mapsOfPaymentsForTerminal {
    if (_mapsOfPaymentsForTerminal.isEmpty) {
      _loadDataFromDatabase(terminalDb: true).then((dataW) {
        _mapsOfPaymentsForTerminal.addAll(dataW);
        notifyListeners();
      });
    }
    return _mapsOfPaymentsForTerminal;
  }

  List<Map> get mapsOfPaymentsForWallet {
    if (_mapsOfPaymentsForWallet.isEmpty) {
      _loadDataFromDatabase(walletDb: true).then((dataW) {
        _mapsOfPaymentsForWallet.addAll(dataW);
        notifyListeners();
      });
    }
    return _mapsOfPaymentsForWallet;
  }
}
