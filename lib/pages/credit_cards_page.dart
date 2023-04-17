import 'dart:math';
import 'package:flutter/material.dart';
import 'package:telcell_copy/widgets/balance_visibility.dart';
import '../widgets/db.dart';
import '../widgets/icon_images.dart';
import 'add_credit_card.dart';

import 'package:flutter_credit_card/flutter_credit_card.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return CardsPageState();
  }
}

class CardsPageState extends State<CardsPage> {
  final double bottomNavBarHeight = kBottomNavigationBarHeight;
  final double appBarHeight = kToolbarHeight;

  List<CreditCardWidget> updatedCreditCards = [];
  @override
  void initState() {
    super.initState();
    getDataFromDatabase();
    //
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

// get data from data base and call addCard to render cards
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

  //add card
  void addCard({
    required int cardNumber,
    required String cardHolder,
    required int expirationDate,
  }) {
    updatedCreditCards.add(CreditCardWidget(
      cardHolderName: cardHolder, //Name of Cardholder
      cardNumber: cardNumber.toString(), //Card Number
      expiryDate: expirationDate.toString(),
      cardBgColor: generateRandomColor(),

      cvvCode: '123',
      bankName: "ID Bank",
      showBackView: false,
      onCreditCardWidgetChange: (p0) => {},
      isHolderNameVisible: true,
    ));
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
                padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  "Cards",
                  style: TextStyle(
                      color: Color.fromRGBO(176, 190, 198, 1), fontSize: 20),
                ),
              ),
              //Cards
              updatedCreditCards.isEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (kToolbarHeight + kBottomNavigationBarHeight) * 2.2,
                      child: Center(
                          child: Image(
                        image: IconImages().bodyImage,
                      )),
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height:
                              (kToolbarHeight + kBottomNavigationBarHeight) *
                                  1.9,
                          child: ListView.builder(
                            itemCount: updatedCreditCards.length,
                            itemBuilder: (
                              BuildContext context,
                              int index,
                            ) {
                              /////////////////////////
                              return SizedBox(
                                width: MediaQuery.of(context).size.width * 0.91,
                                child: updatedCreditCards[index],
                              );
                            },
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height -
                              (kToolbarHeight + kBottomNavigationBarHeight) * 4,
                        ),
                      ],
                    ),

              ElevatedButton(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddCard(),
                    ),
                  );
                  getDataFromDatabase();
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.33,
                    vertical: MediaQuery.of(context).size.height * 0.015,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
                ),
                child: const Text('Bind a Card'),
              )
            ],
          ),
        ));
  }
}
