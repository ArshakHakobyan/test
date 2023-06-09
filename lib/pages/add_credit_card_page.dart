import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:provider/provider.dart';
import 'package:telcell_copy/page_models/add_credit_card_model.dart';
import 'package:telcell_copy/widgets/balance_visibility.dart';

// ignore: must_be_immutable
class AddCard extends StatelessWidget {
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
        title: BalanceVisibility(
          isRouted: true,
        ),
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
              Consumer<AddCreditCardModel>(
                builder: (BuildContext context, cardData, Widget? child) {
                  return CreditCardForm(
                    cardNumber: cardData.cardNumber,
                    cardNumberValidator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Type Card Number';
                      } else if (value.trim().length - 3 < 16 ||
                          value.trim().length - 3 > 16) {
                        return 'Card number must contain 16 digits';
                      } else {
                        if (!context
                            .read<AddCreditCardModel>()
                            .luhnAlgorithm(value.toString())) {
                          return 'Invalid Card';
                        }
                      }
                      return null;
                    },
                    expiryDate: cardData.expiryDate,
                    cardHolderName: cardData.cardHolderName,
                    cardHolderValidator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name and surname';
                      } else if (!RegExp(r'^[a-zA-Z]+\s[a-zA-Z]+$')
                          .hasMatch(value)) {
                        return 'Please enter a valid name and surname';
                      }
                      return null;
                    },
                    cvvCode: cardData.cvvCode,
                    cvvValidator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Type CVV';
                      } else if (value.length > 3) {
                        return 'Cvv number must contain 3 digits';
                      }
                      return null;
                    },
                    onCreditCardModelChange: cardData.onCreditCardModelChange,
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
                  );
                },
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
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    context.read<AddCreditCardModel>().addCreditCardData(
                          cardNumber:
                              context.read<AddCreditCardModel>().cardNumber,
                          cardHolderName:
                              context.read<AddCreditCardModel>().cardHolderName,
                          expiryDate:
                              context.read<AddCreditCardModel>().expiryDate,
                          cvvCode: context.read<AddCreditCardModel>().cvvCode,
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
                    backgroundColor: const Color.fromRGBO(238, 111, 50, 1)),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
