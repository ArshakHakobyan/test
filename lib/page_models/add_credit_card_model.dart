import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:telcell_copy/api/payment_cards.dart';

class AddCreditCardModel extends ChangeNotifier {
  String _cardNumber = '';
  String _expiryDate = '';
  String _cardHolderName = '';
  String _cvvCode = '';
  bool _isCvvFocused = false;
  String postError = '';

  Color generateRandomColor() {
    List<Color> colors = [
      const Color.fromRGBO(0, 0, 0, 1),
      const Color.fromARGB(255, 6, 57, 99),
      const Color.fromRGBO(76, 175, 80, 1),
      const Color.fromRGBO(137, 131, 131, 1),
      const Color.fromRGBO(139, 69, 19, 1)
    ];
    Random random = Random();
    return colors[random.nextInt(5)];
  }

  bool luhnAlgorithm(String cardNumber) {
    List<int> digits = [];
    for (var i = 0; i < cardNumber.length; i++) {
      var digit = int.tryParse(cardNumber[i]);
      if (digit != null) {
        digits.add(digit);
      }
    }
    int checksum = 0;
    // flag indicating are the current digit is the second
    bool isSecondDigit = false;

    for (int i = digits.length - 1; i >= 0; i--) {
      int digit = digits[i];

      if (isSecondDigit) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }
      checksum += digit;
      isSecondDigit = !isSecondDigit;
    }
    // valid card number if the checksum is a multiple of 10
    return (checksum % 10 == 0);
  }

  void addCreditCardData(
      {required String cardNumber,
      required String cardHolderName,
      required String expiryDate,
      String cvvCode = '',
      bool isCvvFocused = false,
      bool useGlassMorphism = false,
      bool useBackgroundImage = false,
      OutlineInputBorder? border}) {
    final Map<String, String> creditCardData = {
      "card_number": cardNumber,
      "card_holder": cardHolderName,
      "expiration_date": expiryDate,
      "cvv": cvvCode,
      'color': generateRandomColor().toString()
    };
    addCreditCard(creditCardData: creditCardData);
  }

  void addCreditCard({required Map<String, String> creditCardData}) async {
    try {
      await PaymentCards().postData(creditCardData);
    } catch (e) {
      postError = e.toString();
    }
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    _cardNumber = creditCardModel!.cardNumber;
    _expiryDate = creditCardModel.expiryDate;
    _cardHolderName = creditCardModel.cardHolderName;
    _cvvCode = creditCardModel.cvvCode;
    _isCvvFocused = creditCardModel.isCvvFocused;
  }

  get cardNumber => _cardNumber;
  get expiryDate => _expiryDate;
  get cardHolderName => _cardHolderName;
  get cvvCode => _cvvCode;
  get isCvvFocused => _isCvvFocused;
  
}
