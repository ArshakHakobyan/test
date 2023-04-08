//import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:telcell_copy/widgets/balance_visibility.dart';
import 'package:telcell_copy/widgets/credit_cards.dart';
import '../widgets/db.dart';
import 'add_credit_card.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return CardsPageState();
  }
}

class CardsPageState extends State<CardsPage> {
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

    setState(() {});
  }

  List? returnedData;
  void addCard({
    required int cardNumber,
    required String cardHolder,
    required int expirationDate,
  }) {
    creditCards.add(CreditCards(
      cardHolder: cardHolder, //Name of Cardholder
      cardNumber: cardNumber, //Card Number
      color: CardColors.blue,
      type: CardTypes.visa,
      bankName: "ID Bank",
      year: expirationDate,
      month: 11,
    ));
  }

  List<CreditCards> creditCards = [
    const CreditCards(
      cardHolder: 'Hayk Hakobyan',
      cardNumber: 2424242454546565,
      color: CardColors.green,
      type: CardTypes.visa,
      bankName: "ID Bank",
      year: 2025,
      month: 12,
    ),
    const CreditCards(
      cardHolder: 'Hayk Hakobyan',
      cardNumber: 2424242454546565,
      color: CardColors.blue,
      type: CardTypes.visa,
      bankName: "ID Bank",
      year: 2025,
      month: 11,
    )
  ];

  @override
  void initState() {
    super.initState();

    getDataFromDatabase();
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(240, 242, 244, 1),
        appBar: AppBar(
            backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
            title: const BalanceVisibility()),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 15),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Cards",
                      style: TextStyle(
                          color: Color.fromRGBO(176, 190, 198, 1),
                          fontSize: 20),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Edit',
                          style: TextStyle(
                              color: Color.fromRGBO(238, 111, 50, 1),
                              fontSize: 15),
                        ))
                  ],
                ),
              ),
              //Cards

              creditCards.isEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height - 250,
                      child: Center(
                        child: Image.network(
                            'https://github.com/ArshakHakobyan/Pics/blob/main/body.png?raw=true'),
                      ),
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: 170,
                          child: ListView.builder(
                            itemCount: creditCards.length,
                            itemBuilder: (BuildContext context, int index) {
                              return creditCards[index];
                            },
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height - 410),
                      ],
                    ),

              ElevatedButton(
                  onPressed: () async {
                    // Navigator.of(context)
                    //     .pushNamed('/credit_cards_page/bindBtn');

                    returnedData = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddCard(),
                      ),
                    );

                    setState(() {
                      //addCard();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
                      minimumSize:
                          Size(MediaQuery.of(context).size.width - 60, 40)),
                  child: const Text('Bind a Card'))
            ],
          ),
        ));
  }
}
