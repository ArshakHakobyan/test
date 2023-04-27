import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:telcell_copy/widgets/balance_visibility.dart';
import '../widgets/db.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});
  @override
  State<AddCard> createState() {
    return AddCardState();
  }
}

class AddCardState extends State<AddCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // for submit button toggle
  final bool _isActive = false;
  // for card Number validation
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

  // color generator function to set credit cards colors randomly
  Color generateRandomColor() {
    List<Color> colors = [
      Colors.black,
      const Color.fromARGB(255, 6, 57, 99),
      Colors.green,
      const Color.fromRGBO(137, 131, 131, 1),
      const Color.fromRGBO(139, 69, 19, 1)
    ];
    Random random = Random();
    return colors[random.nextInt(5)];
  }

// CreditCardForm  function handle
  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
        title:  BalanceVisibility(),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: const Color.fromRGBO(240, 242, 244, 1),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, left: 15),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.1,
                child: const Text(
                  'Bank Card',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(176, 190, 198, 1),
                  ),
                ),
              ),
              // Credit Card Form
              CreditCardForm(
                cardNumber: cardNumber,
                cardNumberValidator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Type Card Number';
                  } else if (value.trim().length - 3 < 16 ||
                      value.trim().length - 3 > 16) {
                    return 'Card number must contain 16 digits';
                  } else {
                    if (!luhnAlgorithm(value.toString())) {
                      return 'Invalid Card';
                    }
                  }
                  return null;
                },
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cardHolderValidator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name and surname';
                  } else if (!RegExp(r'^[a-zA-Z]+\s[a-zA-Z]+$')
                      .hasMatch(value)) {
                    return 'Please enter a valid name and surname';
                  }
                  return null;
                },
                cvvCode: cvvCode,
                onCreditCardModelChange: onCreditCardModelChange,
                themeColor: Colors.black,
                formKey: formKey,
                cvvCodeDecoration: const InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: 'CVV',
                  hintText: 'XXX',
                ),
                cardNumberDecoration: InputDecoration(
                  filled: true,
                  labelText: 'Number',
                  hintText: 'XXXX XXXX XXXX XXXX',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  labelStyle: const TextStyle(color: Colors.grey),
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                expiryDateDecoration: InputDecoration(
                  filled: true,
                  hintStyle: const TextStyle(color: Colors.grey),
                  labelStyle: const TextStyle(color: Colors.grey),
                  focusedBorder: border,
                  enabledBorder: border,
                  labelText: 'Expired Date',
                  hintText: 'XX/XX',
                ),
                cardHolderDecoration: InputDecoration(
                  filled: true,
                  hintStyle: const TextStyle(color: Colors.grey),
                  labelStyle: const TextStyle(color: Colors.grey),
                  focusedBorder: border,
                  enabledBorder: border,
                  labelText: 'Card Holder',
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                height: 55,
                child: const Text(
                  'ATTENTION',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                height: kToolbarHeight * 1.8,
                child: const Text(
                  'There is a 1.5% commission if you\r\n replenish or make payments with cards of \r\n VTB (Armenia)',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    DatabaseHelper.instance.insertDataToDatabase(
                      id: DateTime.now().toString(), //Unique Id
                      cardNumber: cardNumber,
                      cardHolder: cardHolderName,
                      expirationDate: expiryDate,
                      // cvv
                    );
                    Navigator.pop(context, 'Route');
                  } else {
                    null;
                  }
                },
                //Button Style
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.37,
                    vertical: MediaQuery.of(context).size.height * 0.015,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  backgroundColor: _isActive == false
                      ? const Color.fromRGBO(238, 111, 50, 1)
                      : const Color.fromARGB(255, 124, 124, 124),
                ),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
