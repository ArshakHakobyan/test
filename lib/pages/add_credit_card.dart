import 'package:flutter/material.dart';
import 'package:telcell_copy/widgets/balance_visibility.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});
  @override
  State<AddCard> createState() {
    return AddCardState();
  }
}

class AddCardState extends State<AddCard> {
  final cardNumberController = TextEditingController();
  final nameController = TextEditingController();
  final expirationDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
        title: const BalanceVisibility(),
      ),
      body: SingleChildScrollView(
        //????
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: const Color.fromRGBO(240, 242, 244, 1),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                height: 55,
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
              Form(
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: MediaQuery.of(context).size.height / 2.1,
                  color: Colors.white,
                  child: Column(
                    children: [
                      //card Number
                      Container(
                        padding: const EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: const Text(
                          'Card Number',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(176, 190, 198, 1),
                          ),
                        ),
                      ),
                      //card Number field
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                            controller: cardNumberController,
                            cursorColor: Colors.grey,
                            decoration: const InputDecoration()),
                      ),
                      // cardholder name surname
                      Container(
                        padding: const EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: const Text(
                          'Cardholders Name, Surname',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(176, 190, 198, 1),
                          ),
                        ),
                      ),
                      // cardholder name surname field
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                            controller: nameController,
                            cursorColor: Colors.grey,
                            decoration: const InputDecoration()),
                      ),
                      //Expiration Date
                      Container(
                        padding: const EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: const Text(
                          'Expiration Date',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(176, 190, 198, 1),
                          ),
                        ),
                      ),
                      // Expiration Date field
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                            controller: expirationDateController,
                            cursorColor: Colors.grey,
                            decoration: const InputDecoration()),
                      ),
                    ],
                  ),
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
                height: 110,
                child: const Text(
                  'There is a 1.5% commission if you\r\n replenish or make payments with cards of \r\n VTB (Armenia)',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (cardNumberController.text.isNotEmpty &&
                        nameController.text.isNotEmpty &&
                        expirationDateController.text.isNotEmpty) {
                      final List dataToReturn = [
                        cardNumberController.text,
                        nameController.text,
                        expirationDateController.text
                      ];
                      Navigator.pop(context, dataToReturn);
                    } else {
                      Navigator.pop(context);
                    }

                    // Navigator.of(context)
                    //     .pushNamed('/credit_cards_page/bindBtn');
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
                      minimumSize:
                          Size(MediaQuery.of(context).size.width - 60, 40)),
                  child: const Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
