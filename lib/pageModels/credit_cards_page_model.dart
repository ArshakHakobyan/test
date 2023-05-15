import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:http/http.dart' as http;
//import '../widgets/db.dart';

class CardsPageModel extends ChangeNotifier {
  CardsPageModel() {
    getCreditCardData();
  }
  List<CreditCardWidget> _creditCardsList = [];

  void getCreditCardData() async {
    final response = await http.get(
        Uri.parse('https://645f33f89d35038e2d1ec86e.mockapi.io/credit_cards'));
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> dataFromJson =
          (json.decode(response.body) as List<dynamic>)
              .cast<Map<String, dynamic>>();
      _creditCardsList = [];

      for (Map item in dataFromJson) {
        addCard(
            cardNumber: item['card_number'],
            cardHolder: item['card_holder'],
            expirationDate: item['expiration_date'],
            cvv: item['cvv'],
            color: item['color']);
      }
    }
  }

  // void getDataFromDatabase() async {
  //   final List<Map> cards =
  //       await DatabaseHelper.instance.readDataFromDatabase();
  //   for (Map item in cards) {
  //     addCard(
  //       cardNumber: item['card_number'],
  //       cardHolder: item['card_holder'],
  //       expirationDate: item['expiration_date'],
  //     );
  //   }
  // }

  void addCard({
    required String cardNumber,
    required String cardHolder,
    required String expirationDate,
    required String cvv,
    String? color,
  }) {
    _creditCardsList.add(CreditCardWidget(
      cardHolderName: cardHolder, //Name of Cardholder
      cardNumber: cardNumber, //Card Number
      expiryDate: expirationDate,

      glassmorphismConfig: Glassmorphism(
        blurX: 50,
        blurY: 50,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(int.tryParse(color!.substring(6, 16)) ?? 5),
            const Color.fromARGB(255, 144, 102, 35)
          ],
        ),
      ),
      cvvCode: cvv,
      bankName: "ID Bank",
      showBackView: false,
      onCreditCardWidgetChange: (p0) => {},
      isHolderNameVisible: true,
    ));
    notifyListeners();
  }

  get creditCardsList => _creditCardsList;
}
