import 'dart:convert';
import 'package:flutter/material.dart';
//import '../widgets/db.dart';
import 'package:http/http.dart' as http;

class PaymentsHistoryPageModel extends ChangeNotifier {
  final pageController = PageController();
  int pressedButtonNumber = 0;

  PaymentsHistoryPageModel() {
    getTransactions('dayOfPayment');
    getTransactions('dayOfPaymentTerminal');
  }

  void animateTo({required int page}) {
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
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

  // Future<List<Map<String, dynamic>>> _loadDataFromDatabase(
  //     {bool? walletDb, bool? terminalDb}) async {
  //   DatabaseHelper dbHelper = DatabaseHelper.instance;

  //   if (walletDb != null) {
  //     return await dbHelper.readDataFromDatabase(walletDb: true);
  //   } else if (terminalDb != null) {
  //     return await dbHelper.readDataFromDatabase(terminalDb: true);
  //   } else {
  //     throw ArgumentError("Either walletDb or terminalDb must be set");
  //   }
  // }

  void getTransactions(String endPoint) async {
    final response = await http.get(
        Uri.parse('https://645debb912e0a87ac0e2ddf7.mockapi.io/$endPoint'));
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> dataFromJson =
          (json.decode(response.body) as List<dynamic>)
              .cast<Map<String, dynamic>>();
      endPoint == 'dayOfPaymentTerminal'
          ? _mapsOfPaymentsForTerminal.addAll(dataFromJson)
          : _mapsOfPaymentsForWallet.addAll(dataFromJson);
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }

  List<Map> get mapsOfPaymentsForTerminal {
    return _mapsOfPaymentsForTerminal;
  }

  List<Map> get mapsOfPaymentsForWallet {
    return _mapsOfPaymentsForWallet;
  }
}
