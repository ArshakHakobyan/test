import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';

import '../widgets/db.dart';

class CardsPageModel extends ChangeNotifier {
  CardsPageModel() {
    getDataFromDatabase();
  }
  final List<CreditCardWidget> _creditCardsList = [];

  void getDataFromDatabase() async {
    final List<Map> cards =
        await DatabaseHelper.instance.readDataFromDatabase();
    for (Map item in cards) {
      addCard(
        cardNumber: item['card_number'],
        cardHolder: item['card_holder'],
        expirationDate: item['expiration_date'],
      );
    }
  }

  void addCard({
    required String cardNumber,
    required String cardHolder,
    required String expirationDate,
  }) {
    _creditCardsList.add(CreditCardWidget(
      cardHolderName: cardHolder, //Name of Cardholder
      cardNumber: cardNumber, //Card Number
      expiryDate: expirationDate,

      glassmorphismConfig: Glassmorphism(
        blurX: 50,
        blurY: 50,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.black, Color.fromARGB(255, 188, 126, 25)],
        ),
      ),
      cvvCode: '123',
      bankName: "ID Bank",
      showBackView: false,
      onCreditCardWidgetChange: (p0) => {},
      isHolderNameVisible: true,
    ));
    notifyListeners();
  }

  get creditCardsList => _creditCardsList;
}
