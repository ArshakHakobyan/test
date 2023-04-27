import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:telcell_copy/widgets/balance_visibility.dart';

class PaymentsHistoryPage extends StatefulWidget {
  const PaymentsHistoryPage({super.key});
  @override
  State<PaymentsHistoryPage> createState() {
    return PaymentsHistoryPageState();
  }
}

class PaymentsHistoryPageState extends State<PaymentsHistoryPage> {
  int pressedButtonNumber = 1;
  List<Widget> buttonToWidget = [
    const TelcellWallet(),
    const Terminal(),
    const Accounts()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BalanceVisibility(
          isRouted: true,
        ),
        backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
      ),
      body: Column(
        children: [
          //Buttons Bar "Telcell Wallet, Terminal, Accounts"
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.07,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Row(
              children: [
                //Telcell Wallet button
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        //sets first buttons number
                        pressedButtonNumber = 0;
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: pressedButtonNumber == 0
                            ? const Color.fromRGBO(238, 111, 50, 1)
                            : const Color.fromARGB(255, 255, 255, 255),
                        width: 2.0,
                      ))),
                      child: Center(
                        child: Text(
                          "Telcell Wallet",
                          style: TextStyle(
                            color: pressedButtonNumber == 0
                                ? Colors.black
                                : Colors.grey,
                            fontSize: 15,
                            fontWeight: pressedButtonNumber == 0
                                ? FontWeight.w500
                                : FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //Terminal button
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        pressedButtonNumber = 1;
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: pressedButtonNumber == 1
                            ? const Color.fromRGBO(238, 111, 50, 1)
                            : const Color.fromARGB(255, 255, 255, 255),
                        width: 2.0,
                      ))),
                      child: Center(
                        child: Text(
                          "Terminal",
                          style: TextStyle(
                            color: pressedButtonNumber == 1
                                ? Colors.black
                                : Colors.grey,
                            fontSize: 15,
                            fontWeight: pressedButtonNumber == 1
                                ? FontWeight.w500
                                : FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //Accounts button
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        pressedButtonNumber = 2;
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: pressedButtonNumber == 2
                            ? const Color.fromRGBO(238, 111, 50, 1)
                            : const Color.fromARGB(255, 255, 255, 255),
                        width: 2.0,
                      ))),
                      child: Center(
                        child: Text(
                          "Accounts",
                          style: TextStyle(
                            color: pressedButtonNumber == 2
                                ? Colors.black
                                : Colors.grey,
                            fontSize: 15,
                            fontWeight: pressedButtonNumber == 2
                                ? FontWeight.w500
                                : FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          buttonToWidget[pressedButtonNumber],
        ],
      ),
    );
  }
}

class TelcellWallet extends StatefulWidget {
  const TelcellWallet({super.key});
  @override
  State<TelcellWallet> createState() {
    return TelcellWalletState();
  }
}

class TelcellWalletState extends State<TelcellWallet> {
  String date() {
    DateTime date = DateTime.now();
    String formattedDate = DateFormat('d MMMM').format(date);
    return formattedDate;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color.fromRGBO(240, 242, 244, 1),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            // Total This month container
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.085,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, bottom: 10),
              child: Row(
                children: [
                  Text(
                    date(),
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 84, 84, 84)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Terminal extends StatefulWidget {
  const Terminal({super.key});

  @override
  State<Terminal> createState() => _TerminalState();
}

class _TerminalState extends State<Terminal> {
  @override
  Widget build(BuildContext context) {
    return const Text('2');
  }
}

class Accounts extends StatefulWidget {
  const Accounts({super.key});

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  @override
  Widget build(BuildContext context) {
    return const Text('3');
  }
}
