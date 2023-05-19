import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

import 'package:http/http.dart' as http;

import '../api/payment_cards.dart';
//import '../widgets/db.dart';

class CardsPageModel extends ChangeNotifier {
  final PaymentCards paymentCards = PaymentCards();
  bool showLoading = false;
  bool showError = false;

  ScrollController scrollController = ScrollController();
  int currentIndex = 0;
  String _id = '';

  CardsPageModel() {
    creditCardData();
    scrollController.addListener(_scrollListener);
  }
  List<CreditCardWidget> _creditCardsList = [];

  void _scrollListener() {
    currentIndex = (scrollController.offset / 330).round();
    //id in labelExpiredDate
    _id = _creditCardsList[currentIndex].labelCardHolder;
    notifyListeners();
  }

  Future<void> deleteCreditCard() async {
    final url =
        Uri.parse('https://645f33f89d35038e2d1ec86e.mockapi.io/credit_cards/1');
    final response = await http.delete(url);
    if (response.statusCode == 200) {
    } else {}
    creditCardData();
  }

  void creditCardData() async {
    String creditCardEndpoint = 'credit_cards';
    _creditCardsList = [];
    try {
      showLoading = true;
      _creditCardsList = await paymentCards.fetchData(creditCardEndpoint);
      showLoading = false;
    } catch (e) {
      showLoading = false;
      if (e.toString().isNotEmpty) {
        showError = true;
      }
    } finally {
      notifyListeners();
    }
  }

  get creditCardsList => _creditCardsList;
}
